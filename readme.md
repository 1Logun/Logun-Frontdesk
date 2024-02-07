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

Next head over to ``ps-dispatch/shared/config.lua`` and scroll down until you see ``Config.Blips = {`` insert the snippit below under ``Config.Blips = {``
```
   ['GeneralAssistance'] = {
        radius = 0,
        sprite = 66,
        color = 5,
        scale = 1.0,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'GTAO_FM_Events_Soundset',
        offset = false,
        flash = false
    },
    ['WeaponLicenseAssistance'] = {
        radius = 0,
        sprite = 110,
        color = 5,
        scale = 1.0,
        length = 2,
        sound = 'Lose_1st',
        sound2 = 'GTAO_FM_Events_Soundset',
        offset = false,
        flash = false
    },
```

Next go to ``qb-target/init.lua`` and insert the snippit below under ``Config.BoxZones = {``
```
Config.BoxZones = {
	["MRPFrontDesk"] = {     -- MRPD                                                                    
        name = "MissionRowFrontDesk",
        coords = vector3(441.7989, -982.0529, 30.67834),
        length = 0.45,
        width = 0.35,
        heading = 11.0,
        debugPoly = false,
        minZ = 30.77834,
        maxZ = 30.87834,
        options = {
            {
              type = "client",
              event = "logun-frontdesk:opendutymenu",
              icon = "fas fa-sign-in-alt",
              label = "Duty Menu",
              job = "police",
            },
			{
              type = "client",
              event = "logun-frontdesk:openassistancemenu",
              icon = "fas fa-handshake-angle",
              label = "Assistance Menu",
            },
        },
        distance = 3.5
    },
}
```
## Screenshots
![qb-target](https://i.imgur.com/3FX8ter.png)
![Duty Menu](https://i.imgur.com/v6grBht.png)
![Assistance Menu](https://i.imgur.com/TjDzWj2.png)
![General Assistance Dispatch Call](https://i.imgur.com/1G4cwl5.png)
![Weapon License Dispatch Call](https://i.imgur.com/0KmkaqQ.png)
