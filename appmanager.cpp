#include "appmanager.h"

AppManager::AppManager() {}

bool AppManager::isNightMode() const
{
    return m_isNightMode;
}

void AppManager::setIsNightMode(bool newIsNightMode)
{
    if (m_isNightMode == newIsNightMode)
        return;
    m_isNightMode = newIsNightMode;
    emit isNightModeChanged();
}
