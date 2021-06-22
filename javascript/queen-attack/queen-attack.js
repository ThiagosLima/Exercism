export class QueenAttack {
  constructor({
    black: [blackRow, blackColumn] = [0, 3],
    white: [whiteRow, whiteColumn] = [7, 3],
  } = {}) {
    this.black = [blackRow, blackColumn]
    this.white = [whiteRow, whiteColumn]

    this.validatePosition(this.black)
    this.validatePosition(this.white)
    this.validateSameSpace(this.black, this.white)
  }

  toString() {
    let board = [...Array(8)].map(() => Array(8).fill('_'))
    board[this.black[0]][this.black[1]] = 'B'
    board[this.white[0]][this.white[1]] = 'W'

    return board.map(row => row.join(' ')).join('\n')
  }

  get canAttack() {
    return this.isSameRow() || this.isSameColumn() || this.isSameDiagonal() || false
  }

  isSameRow() {
    return this.black[0] === this.white[0]
  }

  isSameColumn() {
    return this.black[1] === this.white[1]
  }

  isSameDiagonal() {
    return Math.abs(this.black[0] - this.white[0]) === Math.abs(this.black[1] - this.white[1])
  }

  validatePosition([row, column]) {
    if (row < 0 || row > 7 || column < 0 || column > 7) {
      throw new Error('Queen must be placed on the board')
    }
  }

  validateSameSpace(black, white) {
    if (black.toString() === white.toString())
      throw new Error('Queens cannot share the same space')
  }
}