#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{

    Q_OBJECT
    Q_PROPERTY(int sppedValue READ sppedValue WRITE setSppedValue NOTIFY sppedValueChanged FINAL)
public:
    Backend();
    int sppedValue() const;
    void setSppedValue(int newSppedValue);
signals:
    void sppedValueChanged();
private:
    int m_sppedValue;
};

#endif // BACKEND_H
