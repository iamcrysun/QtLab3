#include "stamp.h"

Stamp::Stamp()
{

}
QString Stamp::getNameSt() const
{
    return nameSt;
}

QString Stamp::getCountrySt() const
{
    return countrySt;
}

int Stamp::getYearSt() const
{
    return yearSt;
}

int Stamp::getCountSt() const
{
    return countSt;
}
void Stamp::setNameSt(const QString &St)
{
    nameSt = St;
}

void Stamp::setCountrySt(const QString &Ct)
{
    countrySt = Ct;
}

void Stamp::setYearSt(const int number)
{
    yearSt = number;
}


void Stamp::setCountSt(const int stamps)
{
    countSt = stamps;
}

