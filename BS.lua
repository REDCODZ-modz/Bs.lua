
local info = gg.getTargetInfo()

if info.versionName ~= "1.003.650003" then
  gg.alert("Versi game tidak terverifikasi!\nDibutuhkan: 1.003.650003\nVersi saat ini: " .. info.versionName)
  os.exit()
else
  gg.toast("Versi Blood Strike TerVerifikasi.")
  gg.alert("Selamat datang di script Blood Strike!\nBye RedCode: " .. info.versionName)
end



status = {
  BYPASS = false,
  NO_RECOIL_V2 = false,
  BODY_COLOR_GREEN = false,
  BODY_COLOR_RED = false,
  SPEEDHACK = false,
  AIMLOCK = false,
  SILENT_AIM = false,
  NO_RECOIL_V3 = false,
  MAGIC_BULLET = false
}

function ToggleFeature(name, func)
    if status[name] then
        gg.toast(name .. " Deactivated 🔴")
        status[name] = false
    else
        func()
        gg.toast(name .. " Activated 🟢")
        status[name] = true
    end
end

function bp()
    local files_to_remove = {
        "/storage/emulated/0/Android/data/com.netease.newspike/cache/netease_httpdns_config_file.txt",
        "/storage/emulated/0/netease/mpay/oversea/preference/a8510daaeaf882f26cc168803e6c4b25/mpay_oversea_sdk_336",
        "/storage/emulated/0/netease/newspike/logs/report.log",
        "/storage/emulated/0/netease/newspike/logs/anticheat.log",
        "/storage/emulated/0/netease/newspike/config/ban_status.txt",
        "/storage/emulated/0/netease/newspike/config/security_flags.json"
    }
    for _, file in ipairs(files_to_remove) do
        os.remove(file)
    end
end

function BYPASS()
    ToggleFeature("BYPASS", function()
        bp()
    end)
end

function SPEEDHACK()
    ToggleFeature("SPEEDHACK", function()
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("1.75838851929", gg.TYPE_FLOAT)
        gg.getResults(1000)
        gg.editAll("1.76338851452", gg.TYPE_FLOAT)
        gg.toast("SPEED HACK ON✅")
        gg.clearResults()
    end)
end

function NO_RECOIL_V2()
    ToggleFeature("NO_RECOIL_V2", function()
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("1.03499996662", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1.03499996662", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(1000)
        if #results > 0 then
            gg.editAll("0", gg.TYPE_FLOAT)
            gg.toast("🟢 𝙽𝙾 𝚁𝙴𝙲𝙾𝙸𝙻 100% [ON]")
        else
            gg.toast("❌ Data tidak ditemukan!")
        end
        gg.clearResults()
    end)
end

function NO_RECOIL_V3()
    ToggleFeature("NO_RECOIL_V3", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write([[
4770
Var #78AEB4D33C|78aeb4d33c|10|42c60000|0|0|0|0|r-xp|/data/app/~~2ixK4kHRfl-JGjOowpEb_A==/com.netease.newspike-e3E6pu6cKQ9B47Iun6hlCQ==/lib/arm64/libGame.so|16af33c
]]):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
        gg.processResume()
        gg.clearList()
        gg.toast("✓ No Recoil v3 Activated")
    end)
end

function BODY_COLOR_GREEN()
    ToggleFeature("BODY_COLOR_GREEN", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 23786248, value = "0,17700000107", flags = 32}})
    end)
end

function BODY_COLOR_RED()
    ToggleFeature("BODY_COLOR_RED", function()
        local LibStart = gg.getRangesList("libGame.so")[1].start
        gg.setValues({{address = LibStart + 23786252, value = "h 0A D7 1F 41", flags = 32}})
    end)
end

function AIMLOCK()
    ToggleFeature("AIMLOCK", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write([[
24120
Var #78B68F6E80|78b68f6e80|10|3f7f5c29|0|0|0|0|r-xp|/data/app/~~2ixK4kHRfl-JGjOowpEb_A==/com.netease.newspike-e3E6pu6cKQ9B47Iun6hlCQ==/lib/arm64/libGame.so|167ee80
Var #78B68F6E88|78b68f6e88|10|3f800000|0|0|0|0|r-xp|/data/app/~~2ixK4kHRfl-JGjOowpEb_A==/com.netease.newspike-e3E6pu6cKQ9B47Iun6hlCQ==/lib/arm64/libGame.so|167ee88
]]):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
        gg.processResume()
        gg.clearList()
        gg.toast("✓ Aim Lock Activated")
    end)
end

function SILENT_AIM()
    ToggleFeature("SILENT_AIM", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write([[
6851
Var #7D510AEE80|7d510aee80|10|3f800ba6|0|0|0|0|r-xp|/data/app/~~uerLkyDEkzhKqNqHv_980g==/com.netease.newspike-_JLdFLoKXjcIzqyA79UqsA==/lib/arm64/libGame.so|167ee80
Var #7D510AEE88|7d510aee88|10|3f800ba6|0|0|0|0|r-xp|/data/app/~~uerLkyDEkzhKqNqHv_980g==/com.netease.newspike-_JLdFLoKXjcIzqyA79UqsA==/lib/arm64/libGame.so|167ee88
]]):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
        io.open(gg.EXT_CACHE_DIR .. "/crack.txr", "w+"):write(string.char()):close()
        gg.processResume()
        gg.clearResults()
        gg.clearList()
        gg.toast("✓ Silent Aim Activated")
        gg.sleep(1000)
    end)
end

function MAGIC_BULLET()
    ToggleFeature("MAGIC_BULLET", function()
        io.open(gg.EXT_CACHE_DIR .. "/crack.txt", "w+"):write([[
6851
Var #7D510AEE80|7d510aee80|10|3f800eee|0|0|0|0|r-xp|/data/app/~~uerLkyDEkzhKqNqHv_980g==/com.netease.newspike-_JLdFLoKXjcIzqyA79UqsA==/lib/arm64/libGame.so|167ee80
Var #7D510AEE88|7d510aee88|10|3f800eee|0|0|0|0|r-xp|/data/app/~~uerLkyDEkzhKqNqHv_980g==/com.netease.newspike-_JLdFLoKXjcIzqyA79UqsA==/lib/arm64/libGame.so|167ee88
]]):close()
        gg.loadList(gg.EXT_CACHE_DIR .. "/crack.txt", gg.LOAD_VALUES)
        io.open(gg.EXT_CACHE_DIR .. "/crack.txr", "w+"):write(string.char()):close()
        gg.processResume()
        gg.clearResults()
        gg.clearList()
        gg.toast("✓ Magic Bullet Activated")
        gg.sleep(1000)
    end)
end

function MENU_Antena()
    gg.clearResults()
    gg.setRanges(4)
    while true do
      gg.searchNumber("1.35216355324", 16, false, 536870912, 0, -1, 0)
      gg.setVisible(false)
      gg.processResume()
      gg.refineNumber("1.35216355324", 16, false, 536870912, 0, -1, 0)
      gg.setVisible(false)
      for _FORV_4_, _FORV_5_ in ipairs((gg.getResults(1000))) do
        gg.editAll("-9999999999", 16)
        gg.setVisible(false)
      end
      gg.searchNumber("0.58781325817", 16, false, 536870912, 0, -1, 0)
      gg.setVisible(false)
      gg.processResume()
      gg.refineNumber("0.58781325817", 16, false, 536870912, 0, -1, 0)
      gg.setVisible(false)
      for _FORV_4_, _FORV_5_ in ipairs((gg.getResults(1000))) do
        gg.editAll("9999999999", 16)
        gg.setVisible(false)
      end
      gg.sleep(1000)
    end
  end

function MainMenu()
    local menu = gg.multiChoice({
        "➤ BYPASS " .. (status.BYPASS and "🟢" or "🔴"),
        "➤ NO RECOIL V2 " .. (status.NO_RECOIL_V2 and "🟢" or "🔴"),
        "➤ BODY COLOR GREEN " .. (status.BODY_COLOR_GREEN and "🟢" or "🔴"),
        "➤ BODY COLOR RED " .. (status.BODY_COLOR_RED and "🟢" or "🔴"),
        "➤ SPEEDHACK " .. (status.SPEEDHACK and "🟢" or "🔴"),
        "➤ AIM LOCK " .. (status.AIMLOCK and "🟢" or "🔴"),
        "➤ SILENT AIM " .. (status.SILENT_AIM and "🟢" or "🔴"),
        "➤ NO RECOIL V3 " .. (status.NO_RECOIL_V3 and "🟢" or "🔴"),
        "➤ MAGIC BULLET " .. (status.MAGIC_BULLET and "🟢" or "🔴"),
        "➤ Antena",
        "❌ EXIT"
    }, nil, "FINAL VERSION\n🔥 BloodStrike RedCode 🔥\nPilih fitur yang ingin diaktifkan!")

    if menu == nil then return end
    gg.setVisible(false)

    local actions = {
        BYPASS,
        NO_RECOIL_V2,
        BODY_COLOR_GREEN,
        BODY_COLOR_RED,
        SPEEDHACK,
        AIMLOCK,
        SILENT_AIM,
        NO_RECOIL_V3,
        MAGIC_BULLET
    }

    for i, _ in pairs(menu) do
        if i <= #actions then
            actions[i]()
        elseif i == 10 then
            MENU_Antena()
        elseif i == 11 then
            gg.toast("⚠️ SCRIPT DIAKHIRI ⚠️")
            os.exit()
        end
    end
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        MainMenu()
    end
    gg.sleep(100)
end
