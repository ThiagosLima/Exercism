export const gigasecond = date => {
  const GIGA = 10**9
  let newDate = new Date(date)
  newDate.setSeconds(GIGA)

  return newDate
}
