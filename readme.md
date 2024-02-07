# Lo_gun Front Desk

## Dependencies
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [ps-dispatch](https://github.com/project-sloth/ps-dispatch)
  
## Features
- Toggle Duty Through the Duty Menu (Police Only)
- Civillians can call for assistance through the assistance menu either for General Assistance or for Weapon License Assistance
- Can be used at multiple locations
  
## Installation
Head over to ``ps-disptach/client/alerts`` and input the snippit below
```
local function GeneralAssistance()
    local coords = GetEntityCoords(cache.ped)

    local dispatchData = {
        message = 'General Assistance',
        codeName = 'GeneralAssistance',
        code = 'Front Desk',
        icon = 'fas fa-handshake-angle',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'leo' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('GeneralAssistance', GeneralAssistance)

local function WeaponLicenseAssistance()
    local coords = GetEntityCoords(cache.ped)

    local dispatchData = {
        message = 'Weapon License Assistance',
        codeName = 'WeaponLicenseAssistance',
        code = 'Front Desk',
        icon = 'fas fa-handshake-angle',
        priority = 2,
        coords = coords,
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = { 'leo' }
    }

    TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end
exports('WeaponLicenseAssistance', WeaponLicenseAssistance)
```


## Screenshots
![qb-target](https://i.imgur.com/3FX8ter.png)
![Duty Menu](https://i.imgur.com/v6grBht.png)
![Assistance Menu](https://i.imgur.com/TjDzWj2.png)
![General Assistance Dispatch Call](https://i.imgur.com/1G4cwl5.png)
![Weapon License Dispatch Call](https://i.imgur.com/0KmkaqQ.png)
