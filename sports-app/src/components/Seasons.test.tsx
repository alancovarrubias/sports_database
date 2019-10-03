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
  beforeEach(() => {
    act(() => {
      const sport = 'NBA'
      ReactDOM.render(<Seasons sport={sport} />, container)
    })
  })

  test('it shows expected header', () => {
    const header = container.getElementsByTagName('h1')[0]
    expect(header.textContent).toBe('NBA Seasons')
  })

  test('it shows list of seasons', () => {
    const seasonListItems = container.getElementsByTagName('li')
    expect(seasonListItems.length).toBe(1)
    expect(seasonListItems[0].textContent).toBe('2019')
  })
})
