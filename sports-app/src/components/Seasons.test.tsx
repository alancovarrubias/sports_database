import React from 'react'
import { create } from 'react-test-renderer'

import Seasons from './Seasons'

let instance = null
beforeEach(() => {
  const component = create(<Seasons />)
  instance = component.root
})

it('renders Seasons title', () => {
  const header = instance.findByType('h1')
  expect(header.children).toStrictEqual(['Seasons'])
})
