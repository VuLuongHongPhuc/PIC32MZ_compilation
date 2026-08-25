#include <iostream>
#include <stdint.h>
//#include <conio.h>  // _getch()
#include <windows.h> // Sleep
#include <string>
#include <tchar.h>
#include <thread>
#include <chrono>
#include <sstream> // stringstream
#include <iomanip> // setw

#include "SerialCom.h"

//#version 100 core

#define TTL_COM_PORT "COM6"
//#define TTL_COM_PORT "\\\\.\\COM11"    // when greater than 10, you need to prefix with "\\\\.\\"
#define RX_BUFFER_SIZE  128

int main()
{
    SerialCom serial;

    if (!serial.Open(TTL_COM_PORT))
    {
        return 0;
    }

    bool run = true;
    int count = 0;

    std::thread t0([&]() 
    {
        uint8_t buf[RX_BUFFER_SIZE];

        while(run)
        {
            int numberOfBytesRead = serial.Read(buf, RX_BUFFER_SIZE);

            if ((numberOfBytesRead != -1) && (numberOfBytesRead != 0))
            {
                std::ostringstream oss;
                oss << "[" << count++ << "] ";
                oss << "R:\n";
                for (int i = 0; i < numberOfBytesRead; i++)
                {
                    oss << static_cast<char>(buf[i]);
                }
                std::cout << oss.str() << '\n';
            }

            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }

        std::cout << "Thread receive closed!\n";
    });
    
    std::thread t1([&] {
        bool stop = false;
        do
        {
            char c;
            std::cin >> c;

            switch (c)
            {
            case 'q':
                stop = true;
                run = false;
                break;

            case 't':
                std::cout << '[' << count++ << ']' << "W: 0x31\n";
                serial.Write(0x31);
                break;
            
            default:
                break;
            }

        }while(!stop);

        std::cout << "Thread transmit closed!\n";
    });

    t1.join();
    t0.join(); // Wait for the serial thread to finish
    std::cout << "Threads closed!\n";    
    
    return EXIT_SUCCESS;
}

