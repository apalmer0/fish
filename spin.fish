func main() {
  chars := []string{"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"}
  i := 0
  for true {
    if i > len(chars) - 1 {
      i = 0
    }

    fmt.Printf("%s\r", chars[i])
    time.Sleep(100 * time.Millisecond)
    i++
  }
}

function spin
end