#ifndef Stamp_H
#define Stamp_H

#include <QString>
class Stamp
{
private:

    QString nameSt;
    QString countrySt;
    int yearSt;
    int countSt;


public:
    Stamp();
    QString getNameSt() const;
    QString getCountrySt() const;
    int getYearSt() const;
    int getCountSt() const;
    void setNameSt(const QString &St);
    void setCountrySt(const QString &Ct);
    void setYearSt(const int number);
    void setCountSt(const int stamps);
};

#endif // Stamp_H
