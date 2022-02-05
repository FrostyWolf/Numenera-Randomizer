$page = 305

$book = "Numenera - Discovery"

$text = (get-content .\Example.txt) -Replace "â€`“", "-" -Replace "â€™", "'"

$linecount = ($text.count - 1)

$linelist = (0..$linecount)

$table = $linelist | ForEach-Object {
    If ($text[$_] -eq "") {
        $page++
    } Else {
        [PSCustomObject]@{
            Description = $text[$_].substring(3)
            Book = $book
            Page = $Page
        }
    }
}