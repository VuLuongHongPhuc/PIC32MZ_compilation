#include <iostream>
#include <string>
#include <sstream> // stringstream
#include <iomanip> // setw

#include "SerialCom.h"

#define DEF_RX_BUFFER_SIZE 80

//static HANDLE m_hUart = INVALID_HANDLE_VALUE;


SerialCom::SerialCom() 
    : _hUart(INVALID_HANDLE_VALUE),
    _isOpen(false)
{
    
}


bool SerialCom::Open(std::string name)
{
    // Convert std::string to LPCWSTR (wide string)
    //std::wstring wSerialPort(serialPort.begin(), serialPort.end());

    // open com port
    _hUart = CreateFileA(name.c_str(),     // drive name to open
        GENERIC_READ | GENERIC_WRITE,       // must be opened with exclusive access(No Sharing)
        0,                                  // no access to the drive
        NULL,                               // default security attributes
        OPEN_EXISTING,                      // disposition i.e. if file already exist
        FILE_ATTRIBUTE_NORMAL,              // file attributes
        NULL);                              // do not copy file attributes

    if (INVALID_HANDLE_VALUE == _hUart)
    {
        //DWORD error = GetLastError();
        _isOpen = false;
    }
    else
    {
        SetConfiguration();
        FlushReceiveBuffer();

        _isOpen = true;
    }

    return _isOpen;
}

void SerialCom::Close()
{
    if (_hUart != INVALID_HANDLE_VALUE)
    {
        if (CloseHandle(_hUart))
        {
            std::cout << "COM port closed successfully.\n";
        }
        else
        {
            DWORD error = GetLastError();
            std::cout << "ERROR CLOSE HANDLE - Code error : 0x" << std::hex << error << "\n";
        }
        _hUart = INVALID_HANDLE_VALUE;
        _isOpen = false;
    }
    else
    {
        std::cout << "COM port is not open.\n";
    }
}

void SerialCom::SetConfiguration()
{
    DCB dcbSerialParams;
    // set com port settings
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
    if (!GetCommState(_hUart, &dcbSerialParams))
    {
        std::cout << "Could not get COM port settings!\n";
    }
    dcbSerialParams.BaudRate = CBR_115200;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.Parity = NOPARITY;
    dcbSerialParams.StopBits = ONESTOPBIT;
    if (!SetCommState(_hUart, &dcbSerialParams))
    {
        std::cout << "Could not set COM port settings!\n";
    }

    COMMTIMEOUTS timeouts;
    // set com port timeouts
    timeouts.ReadIntervalTimeout = MAXDWORD; // MAXDWORD -> return immediately with any bytes available
    timeouts.ReadTotalTimeoutConstant = 0;
    timeouts.ReadTotalTimeoutMultiplier = 0;
    // Total read timeout = (number of bytes to read * ReadTotalTimeoutMultiplier ) + ReadTotalTimeoutConstant

    timeouts.WriteTotalTimeoutConstant = 100;
    timeouts.WriteTotalTimeoutMultiplier = 10;
    // Total write timeout = (number of bytes to write * WriteTotalTimeoutMultiplier) + WriteTotalTimeoutConstant

    if (!SetCommTimeouts(_hUart, &timeouts))
    {
        std::cout << "Could not set COM port timeouts!\n";
    }
}

void SerialCom::Write(const uint8_t& c)
{
    if (!_isOpen)
    {
        return;
    }

    uint8_t buf[1] = { 0x55 };
    DWORD bytes_write = 0;

    buf[0] = c;

    if (!WriteFile(_hUart, buf, 1, &bytes_write, NULL))
    {
        DWORD error = GetLastError();
        std::cout << "ERROR WRITE - Code error : 0x" << std::hex << error << "\n";
        std::cout << __LINE__ << " - " << __FUNCTION__ << " - " << __FILE__ << "\n";
    }

    //std::cout << "W: 0x" << std::hex << (int)buf[0] << '\n';
}

int32_t SerialCom::Write(uint8_t const * const pBuf, const int lenght)
{
    if (!_isOpen)
    {
        return -1;
    }

    DWORD bytes_write = 0;

    if (!WriteFile(_hUart, pBuf, lenght, &bytes_write, NULL))
    {
        DWORD error = GetLastError();
        std::cout << "ERROR WRITE - Code error : 0x" << std::hex << error << "\n";
        std::cout << __LINE__ << " - " << __FUNCTION__ << " - " << __FILE__ << "\n";
        return -1;
    }

    return static_cast<int32_t>(bytes_write);
}

void SerialCom::FlushReceiveBuffer()
{
    if (!_isOpen)
    {
        return;
    }

    int loop_cnt = 0;

    char buf[DEF_RX_BUFFER_SIZE + 1] = { 0 };
    DWORD bytes_read = 0;

    do
    {
        if (!ReadFile(_hUart, buf, DEF_RX_BUFFER_SIZE, &bytes_read, NULL))
        {
            DWORD error = GetLastError();
            std::cout << "ERROR READ - Code error : 0x" << std::hex << error << "\n";
            std::cout << __LINE__ << " - " << __FUNCTION__ << " - " << __FILE__ << "\n";
            break;
        }

        if (bytes_read == 0)
        {
            break;
        }

        loop_cnt++;
    }while(loop_cnt < 10);
}


/**
* @brief Read buffer COMx
* @param[out] pBuf - store receive buffer
* @param[in] lenght - pBuf size
* @return number of data read or -1 if error
*/
int32_t SerialCom::Read(uint8_t * pBuf, const uint32_t lenght)
{
    if (!_isOpen)
    {
        return -1;
    }

    DWORD bytes_read = 0;

    if (!ReadFile(_hUart, pBuf, lenght, &bytes_read, NULL))
    {
        DWORD error = GetLastError();
        std::cout << "ERROR READ - Code error : 0x" << std::hex << error << "\n";
        std::cout << __LINE__ << " - " << __FUNCTION__ << " - " << __FILE__ << "\n";
        return -1;
    }
    else
    {
#if 0
        std::stringstream ss;
        std::string str1_hex = "R";

        for (int i = 0; i < bytes_read; i++)
        {
            ss << " 0x" << std::setw(2) << std::hex << (int)pBuf[i];
        }

        str1_hex += ss.str();

        std::cout << std::setw(2) << std::dec << bytes_read << ":";
        std::cout << str1_hex << '\n';
#endif
    }

    return static_cast<int32_t>(bytes_read);
}



/*EOF*/
