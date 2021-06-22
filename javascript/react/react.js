export class InputCell {
  constructor(value) {
    this.value = value
    this.callbacks = null
    this.params = null
  }

  setValue(value) {
    if (this.value !== value) this.callbacks
    this.value = value
  }
}

export class ComputeCell {
  constructor(inputCells, fn) {
    this.inputCells = inputCells
    this.value = fn(inputCells)
    this.callbacks = this.addCallback(() => fn(inputCells))
    // inputCells.forEach(cell => {
    //   cell.callbacks = this.callbacks
    //   cell.params = inputCells
    // })
  }

  addCallback(cb) {
    this.inputCells.forEach(cell => {
      
    })
  }

  removeCallback(cb) {
    throw new Error('Remove this statement and implement this function');
  }
}

export class CallbackCell {
  constructor(fn) {
    throw new Error('Remove this statement and implement this function');
  }
}
