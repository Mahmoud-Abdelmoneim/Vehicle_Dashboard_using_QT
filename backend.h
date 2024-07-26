#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int SpeedValue READ SpeedValue WRITE setSpeedValue NOTIFY SpeedValueChanged FINAL)
public:
    explicit Backend(QObject *parent = nullptr);

    int SpeedValue() const;
    void setSpeedValue(int newSpeedValue);

signals:
    void SpeedValueChanged();
private:
    int m_SpeedValue;
};

#endif // BACKEND_H
