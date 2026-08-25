#pragma once

#include <Windows.h>
#include <stdint.h>

class SerialCom
{
public:
	
	SerialCom();
		

	bool Open(std::string name);
	void Close();
	void Write(const uint8_t& c);
	int32_t Write(uint8_t const * const pBuf, const int lenght);
	int32_t Read(uint8_t *pBuf, const uint32_t lenght);
	void FlushReceiveBuffer();

	bool IsOpen() { return _isOpen; };

private:
	void SetConfiguration();

private:
	std::string _name;
	HANDLE _hUart;
	bool _isOpen;

};

