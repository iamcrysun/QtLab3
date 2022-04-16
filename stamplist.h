#ifndef STAMPLIST_H
#define STAMPLIST_H


#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QModelIndex>
#include <QItemSelectionModel>
#include "stamp.h"

class StampList : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(QAbstractListModel* stampModel READ getModel CONSTANT)  /* первый параметр - тип свойства (property)
                                                                     второй параметр - имя свойства, по которому будем обращаться к реальной модели в qml-файле
                                                                     третий параметр - метод С++ для получения значения свойства (получим саму модель)
                                                                     CONSTANT - qml получит свойство однократно, и в процессе работы это свойство изменяться не будет */
private:
    QList<Stamp> listOfStamps; // непосредственно данные
    QAbstractListModel *getModel();

public:
    StampList(QObject *parent = nullptr);
    ~StampList() override;

    // количество колонок
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;

     // возвращение данных модели по указанному индексу и роли
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;

    enum ResentRoles {
            name = Qt::DisplayRole,
            country=Qt::UserRole + 1,
            year = Qt::UserRole + 2,
            count = Qt::UserRole + 3,
       };

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE QString find(const int textSelArea);
    Q_INVOKABLE void add(const QString& nameSt, const QString& countrySt, const int yearSt, const int countSt);  // макрос указывает, что к методу можно обратиться из QML
    Q_INVOKABLE void del(const int index);
    Q_INVOKABLE void edit(const QString& nameSt, const QString& countrySt, const int yearSt, const int countSt, const int index);

};

#endif // STAMPLIST_H
