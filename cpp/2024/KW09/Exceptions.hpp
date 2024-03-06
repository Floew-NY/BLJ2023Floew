#ifndef MY_CUSTOM_EXCEPTION_HPP
#define MY_CUSTOM_EXCEPTION_HPP

#include <exception>

class TriangleException : public std::exception
{
public:
    const char *what() const noexcept override
    {
        return "Triangle Exception";
    }
};

class IllegalTriangleSideException : public TriangleException
{
public:
    const char *what() const noexcept override
    {
        return "ERR96TF";
    }
};

class NegativeTriangleException : public TriangleException
{
public:
    const char *what() const noexcept override
    {
        return "ERR12TF";
    }
};

class ImpossibleTriangleException : public TriangleException
{
public:
    const char *what() const noexcept override
    {
        return "ERR36TF";
    }
};

class ZeroTriangleException : public TriangleException
{
public:
    const char *what() const noexcept override
    {
        return "ERR16TF";
    }
};

class TriangleIsLineException : public TriangleException
{
public:
    const char *what() const noexcept override
    {
        return "ERR56TF";
    }
};

#endif