#include "Stamplist.h"
#include <QDebug>

StampList::StampList(QObject* parent):QAbstractListModel(parent)
{

    add("Марка 1", "США", 2001, 500000);
    add("Марка 2", "Россия", 2021, 500);
    add("Марка 3", "США", 2011, 9868);
    add("Марка 4", "Россия", 2002, 21);

}

StampList::~StampList()
{

}

int StampList::rowCount(const QModelIndex&) const
{
    return listOfStamps.size();
}


QVariant StampList::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= listOfStamps.size())
            return QVariant();
      {
        switch (role) {
                case name:
                    return QVariant(listOfStamps.at(index.row()).getNameSt());
                case year:
                    return QVariant(listOfStamps.at(index.row()).getYearSt());

                case count:
                    return QVariant(listOfStamps.at(index.row()).getCountSt());

                case country:
                    return QVariant(listOfStamps.at(index.row()).getCountrySt());


                default:
                    return QVariant();
            }

    }
}

QHash<int, QByteArray> StampList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[name] = "nameSt";
    roles[year] = "yearSt";
    roles[count] = "countSt";
    roles[country] = "countrySt";

       return roles;
}

void StampList::add(const QString& nameSt, const QString& countrySt, const int yearSt, const int countSt){
     Stamp Stamp;
    Stamp.setNameSt(nameSt);
    Stamp.setYearSt(yearSt);
    Stamp.setCountSt(countSt);
    Stamp.setCountrySt(countrySt);
    beginInsertRows(QModelIndex(),listOfStamps.size(),listOfStamps.size());
    listOfStamps.append(Stamp);  //добавление в конец списка
    endInsertRows();

}

QAbstractListModel* StampList::getModel(){
    return this;
}

QString StampList::find(const int textSelArea){
    qDebug() << name << year << country<<count;
    int cnt = 0;
    for(int i = 0; i < listOfStamps.size(); i++)
        if(listOfStamps[i].getCountSt() <= textSelArea)
            cnt++;
    QString c = QString::number(cnt);
    return c;

}

void StampList::del(const int index){

     if (index >= 0 && index < listOfStamps.size())
     {

    // сообщение модели о процессе удаления данных
         beginRemoveRows(QModelIndex(), index, index);
        listOfStamps.removeAt(index);
              endRemoveRows();
     }
     else qDebug() << "Error index";

}




void StampList::edit(const QString& nameSt,const QString& countrySt, const int yearSt, const int countSt, const int index) {
     if(index >= 0 && index < listOfStamps.size() )
     {
        auto& currentStamp = listOfStamps[index];
        if (currentStamp.getNameSt().compare(nameSt)!=0 || currentStamp.getCountrySt().compare(countrySt)!=0 || currentStamp.getYearSt() != yearSt || currentStamp.getCountSt() != countSt )
        {
            currentStamp.setNameSt(nameSt);
            currentStamp.setYearSt(yearSt);
            currentStamp.setCountSt(countSt);
            currentStamp.setCountrySt(countrySt);


            auto modelIndex = createIndex(index, 0);
            emit dataChanged(modelIndex, modelIndex);
            qDebug() << listOfStamps[index].getNameSt();
        }

     }
      else qDebug() << "Error index";
}
