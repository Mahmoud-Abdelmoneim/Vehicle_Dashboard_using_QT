#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

int Backend::SpeedValue() const
{
    return 270;
}

void Backend::setSpeedValue(int newSpeedValue)
{
    if (m_SpeedValue == newSpeedValue)
        return;
    m_SpeedValue = newSpeedValue;
    emit SpeedValueChanged();
}
