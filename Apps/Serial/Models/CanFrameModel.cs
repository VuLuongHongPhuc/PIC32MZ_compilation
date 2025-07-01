using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Interop;

namespace Serial.Models
{
    public class CanFrameModel
    {
        public enum CAN_FRAME_DEF_enum : int
        {
            DEF_FRAME_SIZE = 16,
            DEF_FRAME_SYNC_START = 0x03,
            DEF_FRAME_SYNC_END = 0x15
        }


        static private uint _count = 0;


        uint _frameCount;
        UInt64 _time;
        byte _frameType;
        UInt32 _id;
        byte[] _data;
        byte _dlc;
        string _rw;


        public uint FrameCount { get => _frameCount;}
        public UInt64 Time { get => _time; set => _time = value; }
        public byte FrameType { get => _frameType; set => _frameType = value; }
        public UInt32 Id { get => _id; set => _id = value; }
        public byte[] Data { get => _data; set => _data = value; }
        public byte Dlc { get => _dlc; set => _dlc = value; }
        public string RW { get => _rw; set => _rw = value; }

        public CanFrameModel()
        {
            _frameCount = _count++;
            _id = 0;
            _data = new byte[32];
            _dlc = 0;
            _rw = "R";
        }

        public void ResetFrameCount()
        {
            _count = 0;
        }

        public bool FormatRaw(byte[] rawData)
        {
            if (rawData.Length < (int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE)
                return false;

            if (rawData[0] != 0x03)
                return false;

            if (rawData[15] != 0x15)
                return false;



            FrameType = rawData[1];

            Id = (UInt32)(rawData[2]);
            Id |= (UInt32)(rawData[3]<<8);
            Id |= (UInt32)(rawData[4]<<16);
            Id |= (UInt32)(rawData[5]<<24);

            Dlc = rawData[6];

            Data[0] = rawData[7];
            Data[1] = rawData[8];
            Data[2] = rawData[9];
            Data[3] = rawData[10];
            Data[4] = rawData[11];
            Data[5] = rawData[12];
            Data[6] = rawData[13];
            Data[7] = rawData[14];

            return true;
        }

        public byte[] toBytes()
        {
            byte[] values = new byte[(int)CAN_FRAME_DEF_enum.DEF_FRAME_SIZE];

            values[0] = (byte)CAN_FRAME_DEF_enum.DEF_FRAME_SYNC_START;  // SOF

            values[1] = 0;  // frame type

            values[2] = (byte)Id;          // id
            values[3] = (byte)(Id >> 8);   // id
            values[4] = (byte)(Id >> 16);  // id
            values[5] = (byte)(Id >> 24);  // id

            values[6] = Dlc;               // dlc

            values[7] = Data[0];           // data 0
            values[8] = Data[1];           // data 1
            values[9] = Data[2];           // data 2
            values[10] = Data[3];          // data 3
            values[11] = Data[4];          // data 4
            values[12] = Data[5];          // data 5
            values[13] = Data[6];          // data 6
            values[14] = Data[7];          // data 7

            values[15] = (byte)CAN_FRAME_DEF_enum.DEF_FRAME_SYNC_END;   // EOF

            return values;
        }

    }
}
