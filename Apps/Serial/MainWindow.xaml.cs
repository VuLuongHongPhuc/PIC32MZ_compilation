using Serial.Models;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static Serial.Models.CanFrameModel;

namespace Serial
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //static Mutex mutex = new Mutex();        
        static readonly object _lockViewList = new object();// Shared object for locking

        static readonly object _lockSerial = new object();
        System.IO.Ports.SerialPort _serial= new System.IO.Ports.SerialPort();

        Stopwatch _stopwatch = new Stopwatch();
        double _lasttime = 0;

        public ObservableCollection<CanFrameModel> _CollectionCAN = new ObservableCollection<CanFrameModel>();

        public MainWindow()
        {
            InitializeComponent();

            lvFrameCan.ItemsSource = _CollectionCAN;

            UpdateListCOM();

            _serial.DataReceived += (s, e) => {

                lock (_lockSerial)
                { 
                    System.IO.Ports.SerialPort sp = (System.IO.Ports.SerialPort)s;

                    if (sp == null)
                    {
                        Debug.WriteLine("[ERROR] Serial handler null");
                        return;
                    }

                    int numberOfBytesRead = 0;
                    do 
                    { 
                        numberOfBytesRead = sp.BytesToRead;

                        if (numberOfBytesRead >= (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE)
                        {
                            numberOfBytesRead -= (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE;

                            byte[] buf = new byte[(int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE];

                            int nLu = sp.Read(buf, 0, (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE);
                            if (nLu == (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE)
                            {
                                CanFrameModel frame = new CanFrameModel();

                                frame.FormatRaw(buf);

                                double now = _stopwatch.Elapsed.TotalMicroseconds;
                                frame.Time = (UInt64)(now - _lasttime);
                                _lasttime = now;

                                AddNewCanMessage(frame);
                            }
                        }
                    } while (numberOfBytesRead >= (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE);
                }
            };

        }

        void UpdateListCOM()
        {
            cbSelectCOM.Items.Clear();

            // ports names
            string[] ports = System.IO.Ports.SerialPort.GetPortNames();

            foreach (string port in ports)
            {
                cbSelectCOM.Items.Add(port);
            }

            if (cbSelectCOM.Items.Count > 0)
            {
                cbSelectCOM.SelectedIndex = 0;
            }
        }

        void Connect()
        {
            if (cbSelectCOM.SelectedIndex == -1)
            {
                MessageBox.Show("No COM selected");
            }

            if (_serial.IsOpen)
            {
                CloseCom();
            }

            _serial.PortName = cbSelectCOM.Text;
            _serial.BaudRate = 115200;
            _serial.DataBits = 8; // 8 or 9
            _serial.Parity = Parity.None;
            _serial.StopBits = StopBits.One;
            _serial.Handshake = Handshake.None;
            //_serial.RtsEnable = false;
            _serial.WriteTimeout = 100; // in milliseconde
            _serial.ReadTimeout = 100;

            try
            {
                _serial.Open();
                _serial.DiscardInBuffer();
                Debug.WriteLine("Serial Open.");

                //enable/disable connection button
                btnDisconnect.IsEnabled = true;
                btnConnect.IsEnabled = false;
                btnUpdate.IsEnabled = false;                

                //start watching the timeout
                _stopwatch.Start();
                _lasttime = 0;
            }
            catch (IOException ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        void CloseCom()
        {
            _serial.Close();
            _stopwatch.Stop();

            btnDisconnect.IsEnabled = false;
            btnConnect.IsEnabled = true;
            btnUpdate.IsEnabled = true;

            Debug.WriteLine("Serial Close.");
        }

        public delegate void AddNewCanMessageAppend(CanFrameModel frame);
        public void AddNewCanMessage(CanFrameModel frame)
        {
            if (!Dispatcher.CheckAccess())
            {
                Dispatcher.Invoke(new AddNewCanMessageAppend(AddNewCanMessage), frame);
                return;
            }

            //TODO: your code

            // Lock viewlist for update
            lock (_lockViewList)
            {
                _CollectionCAN.Add(frame);

                // limit items in the collection
                if (_CollectionCAN.Count > 100)
                {
                    _CollectionCAN.RemoveAt(0);
                }

                // set scroll view to the bottom list
                lvFrameCan.ScrollIntoView(lvFrameCan.Items[lvFrameCan.Items.Count - 1]);
            }
        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            Connect();
        }

        private void btnDisconnect_Click(object sender, RoutedEventArgs e)
        {
            CloseCom();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            UpdateListCOM();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            // Try to acquire the lock with a 2-second timeout
            if (Monitor.TryEnter(_lockViewList, TimeSpan.FromSeconds(2)))
            {
                _CollectionCAN.Clear();

                Monitor.Exit(_lockViewList);
            }
            else
            {
                MessageBox.Show("Process busy. Could not clear the list.", "Information");
                Debug.WriteLine("Could not acquire the lock within 2 seconds.");
            }
        }

        private void btnSendFrame_Click(object sender, RoutedEventArgs e)
        {
            if (_serial.IsOpen)
            {
                CanFrameModel frame = new CanFrameModel();

                frame.Id = 0x1F201234;

                frame.Dlc = 8;

                frame.Data[0] = 0x01;
                frame.Data[1] = 0x02;
                frame.Data[2] = 0x03;
                frame.Data[3] = 0x04;
                frame.Data[4] = 0x05;
                frame.Data[5] = 0x06;
                frame.Data[6] = 0x07;
                frame.Data[7] = 0x08;

                frame.RW = "W";

                byte[] data = frame.toBytes();

                try
                {
                    _serial.Write(data, 0, data.Length);
                    AddNewCanMessage(frame);
                }
                catch (Exception ex)
                {
                    Debug.WriteLine($"Failed to send frame {ex.Message}");
                }
            }
        }
    }
}