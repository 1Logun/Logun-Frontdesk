QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("logun-frontdesk:openassistancemenu", function()
    exports['qb-menu']:openMenu({
        {
            header = 'Police Assistance',
            icon = 'fas fa-user',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'General Assistance',
            txt = 'Request an officer for general assistance!',
            icon = 'fas fa-clipboard-question',
            params = {
                event = 'logun-frontdesk:generalassistancecall'
            }
        },
        {
            header = 'Weapon License Assistance',
            txt = 'Request an officer for assistance with a weapons license!',
            icon = 'fas fa-gun',
            params = {
                event = 'logun-frontdesk:weaponlicenseassistancecall'
            }
        },
        {
            header = 'Close Menu',
            txt = "",
            icon = 'fas fa-circle-xmark',
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
    })
end)

RegisterNetEvent("logun-frontdesk:opendutymenu", function()
    exports['qb-menu']:openMenu({
        {
            header = 'Police Duty',
            icon = 'fas fa-user',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Toggle Duty',
            txt = 'Go On / Off Duty',
            icon = 'fas fa-check-to-slot',
            params = {
                event = 'qb-policejob:ToggleDuty'
            }
        },
        {
            header = 'Close Menu',
            txt = "",
            icon = 'fas fa-circle-xmark',
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
    })
end)

RegisterNetEvent('logun-frontdesk:generalassistancecall')
AddEventHandler('logun-frontdesk:generalassistancecall', function()
    exports['ps-dispatch']:GeneralAssistance()
end)

RegisterNetEvent('logun-frontdesk:weaponlicenseassistancecall')
AddEventHandler('logun-frontdesk:weaponlicenseassistancecall', function()
    exports['ps-dispatch']:WeaponLicenseAssistance()
end)
