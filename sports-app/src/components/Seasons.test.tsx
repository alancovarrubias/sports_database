import React from 'react'
import ReactDOM from 'react-dom'
import { act } from 'react-dom/test-utils'

import Seasons from './Seasons'

let container
beforeEach(() => {
    container = document.createElement('div')
    document.body.appendChild(container)
})

afterEach(() => {
    document.body.removeChild(container)
    container = null
})

describe('Seasons component', () => {
  test('it shows expected text', () => {
    act(() => {
      ReactDOM.render(<Seasons sport='NBA' />, container)
    })
    const header = container.getElementsByTagName('h1')[0]
    expect(header.textContent).toBe('NBA Seasons')
  })
})
