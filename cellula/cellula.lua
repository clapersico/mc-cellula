local monitor = peripheral.wrap( "back" )
local cellula = 0
local apparato = ""
local status  = ""
local settore = "";
local potMbr  = 0;

local function caricamentoInfoCellula()
    local file = fs.open("info", "r")

    cellula = file.readLine()
    settore = file.readLine()
    apparato = file.readLine()

    file.close()
end

local function showInfoCellula()
    -- Numero Cellula
    monitor.setCursorPos(1, 1)
    monitor.setTextColor(colors.white)
    monitor.write( "Cellula:  " )
    monitor.setTextColor(colors.blue)
    monitor.write(cellula)

    -- Settore Cellula
    monitor.setCursorPos(1, 2)
    monitor.setTextColor(colors.white)
    monitor.write( "Settore:  " )
    monitor.setTextColor(colors.blue)
    monitor.write(settore)

    -- Apparato Cellula
    monitor.setCursorPos(1, 3)
    monitor.setTextColor(colors.white)
    monitor.write( "Apparato: " )
    monitor.setTextColor(colors.blue)
    monitor.write(apparato)

    -- Stato Cellula
    monitor.setCursorPos(1, 4)
    monitor.setTextColor(colors.white)
    monitor.write( "Status:   " )
    if status == "1" then
        monitor.setTextColor(colors.green)
        monitor.write("On-Line")
    end

    -- Potenziale di Membrana
    monitor.setCursorPos(1, 5)
    monitor.setTextColor(colors.white)
    monitor.write( "Pote.Memb:  " )
    monitor.setTextColor(colors.blue)
    monitor.write(potMbr)
end

local function caricamentoStatoCellula()
    local f = fs.open("status", "r")

    status = f.readLine()
    potMbr = f.readLine()

    f.close()
end

monitor.clear()

caricamentoInfoCellula()
caricamentoStatoCellula()
showInfoCellula()