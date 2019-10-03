import React from 'react'

import { SeasonsComponentProps } from '../types'

const SeasonsComponent: React.FC<SeasonsComponentProps> = ({ sport, seasons }) => {
  return (
    <div>
      <h1>{sport} Seasons</h1>
      <ul>
        {seasons.map(season =>  (
          <li key={season.id}>{ season.year }</li>
        ))}
      </ul>
    </div>
  )
}

export default SeasonsComponent
