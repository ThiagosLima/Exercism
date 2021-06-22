export const decodedValue = colors => {
  const ten = COLORS.indexOf(colors[0])
  const unity = COLORS.indexOf(colors[1])

  return ten * 10 + unity
}

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
]
