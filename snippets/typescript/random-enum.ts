export function randomEnum<T>(enumerable: object): T[keyof T] {
  const keys = Object.keys(enumerable).map(item => item.toString()).sort()
  const values = Object.values(enumerable).map(item => item?.toString()).sort()
  if (JSON.stringify(keys) === JSON.stringify(values)) {
    const possibleValues = values.slice(0, keys.length / 2)
    const randomValue = possibleValues[Math.floor(Math.random() * possibleValues.length)]
    return randomValue
  }

  const possibleValues = Object.values(enumerable)
  return possibleValues[Math.floor(Math.random() * possibleValues.length)]
}
