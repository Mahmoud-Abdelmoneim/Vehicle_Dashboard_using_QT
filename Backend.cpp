#include "Backend.h"

Backend::Backend() {}

int Backend::sppedValue() const
{
    return 40;
}

void Backend::setSppedValue(int newSppedValue)
{
    if (m_sppedValue == newSppedValue)
        return;
    m_sppedValue = newSppedValue;
    emit sppedValueChanged();
}
