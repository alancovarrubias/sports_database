import React from 'react';
import renderer from 'react-test-renderer';
import { MockedProvider } from '@apollo/react-testing';
import wait from 'waait';

import Seasons, { GET_SEASONS } from './Seasons';

const { act } = renderer
/*
let container
beforeEach(() => {
    container = document.createElement('div')
    document.body.appendChild(container)
})

afterEach(() => {
    document.body.removeChild(container)
    container = null
})
*/

const seasonsMock = {
  request: {
    query: GET_SEASONS,
  },
  result: {
    data: {
      seasons: [{ id: '1', year: 2019 }],
    },
  },
};

it("should render without error", () => {
  renderer.create(
    <MockedProvider mocks={[]}>
      <Seasons />
    </MockedProvider>
  );
});

/*
const sport = 'NBA'
let component;
describe('Seasons component', () => {
  it('should render loading state initially', () => {
    renderer.act(() => {
      component = renderer.create(
        <MockedProvider mocks={[]}>
          <Seasons sport={sport} />
        </MockedProvider>
      );
    });
    const tree = component.toJSON();
    expect(tree.children).toContain('Loading...');
  });

  test('it shows expected header', async () => {
    renderer.act(() => {
      component = renderer.create(
        <MockedProvider mocks={[seasonsMock]} addTypename={false}>
          <Seasons sport={sport} />
        </MockedProvider>
      );
    });

    await wait(0);
    // const header = component.root.findByType('h1')
    const h1 = component.root.findByType('h1');
    expect(h1.children).toContain('NBA')
  })

  test('it shows list of seasons', () => {
    const seasonListItems = container.getElementsByTagName('li')
    expect(seasonListItems.length).toBe(1)
    expect(seasonListItems[0].textContent).toBe('2019')
  })
})
*/
