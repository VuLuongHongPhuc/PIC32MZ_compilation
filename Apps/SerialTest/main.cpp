#include <iostream>
#include <stdint.h>
//#include <conio.h>  // _getch()
#include <windows.h> // Sleep
#include <string>
#include <tchar.h>
#include <thread>
#include <sstream> // stringstream
#include <iomanip> // setw

#include "SerialCom.h"

//#version 100 core


static bool g_Exit = false;


void ThreadSerial()
{
    SerialCom serial("ToDoLater");
    if (serial.Open("COM6") == -1)
    {
        std::cout << "ERROR Open COM\n";
        //return EXIT_FAILURE;
        return;
    }

    int countRx = 0;
    uint32_t countTxLine = 0;

    while (g_Exit == false)
    {
        uint8_t buf[8] = { 0 };
        int32_t bytes_read = serial.Read(buf, sizeof(buf));
        
        if (bytes_read > 0)
        {
            std::stringstream ss;
            ss << "[" << countTxLine++ << "] ";
            ss << "Bytes read:" << std::setw(2) << std::dec << bytes_read << "\n";
            for (int i = 0; i < bytes_read; i++)
            {
                if (buf[i] < 0x10)
                {
                    //ss << " 0x0" << std::setw(2) << std::hex << (int)buf[i];
                    ss << " 0x0" << std::hex << (int)buf[i];
                }
                else
                {
                    ss << " 0x" << std::hex << (int)buf[i];
                }
            }
            std::cout << ss.str() << '\n';
        }
        else if (bytes_read == -1)
        {
            std::cout << "Error reading data\n";
        }

        Sleep(100); // Sleep to avoid busy waiting
#if 1
        if (countRx++ > 20)
        {
            // Example of sending data
            uint8_t dataToSend = 0xAA; // Example data
            serial.Write(dataToSend);
            std::cout << "Sent: 0x" << std::hex << (int)dataToSend << '\n';
            countRx = 0; // Reset count after sending
        }
#endif
    }

    serial.Close();
}


void ThreadSignalOut()
{
    std::cout << "Press Enter to exit...\n";
    std::cin.get(); // Wait for user input to exit

    g_Exit = true;

    // Optionally, you can signal the serial thread to stop if needed
    // This could be done by setting a flag or using a condition variable
    // to notify the thread to exit gracefully.
    std::cout << "Exiting...\n";
}

int main()
{
    std::thread serialThread(ThreadSerial);
    std::thread signalThread(ThreadSignalOut);
    serialThread.join(); // Wait for the serial thread to finish
    signalThread.join(); // Wait for the signal thread to finish


    std::cout << "Threads finished.\n";    
    std::cout << "Exiting main thread.\n";    
    
    return EXIT_SUCCESS;
}

