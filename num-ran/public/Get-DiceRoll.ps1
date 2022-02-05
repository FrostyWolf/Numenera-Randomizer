function Get-DiceRoll {
    param(
        [String]$Roll
    )
    If ($roll -notlike "*d*") {
        return $Roll
    }
    
        $TotalRoll = 0
        $SplitRoll = $roll.split("d").split("+")
        (1..($SplitRoll[0])).foreach({
            $TotalRoll = (Get-Random -Minimum 1 -Maximum (([int]$SplitRoll[1]) + 1)) + $TotalRoll
        })
        return $TotalRoll + [int]$SplitRoll[2]
    
}