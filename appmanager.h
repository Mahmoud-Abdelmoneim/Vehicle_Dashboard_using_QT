#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>

class AppManager: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isNightMode READ isNightMode WRITE setIsNightMode NOTIFY isNightModeChanged)
public:
    AppManager();
    bool isNightMode() const;
    void setIsNightMode(bool newIsNightMode);
signals:
    void isNightModeChanged();
private:
    bool m_isNightMode;
};

#endif // APPMANAGER_H
