import React from 'react'
import { useQuery } from '@apollo/react-hooks'
import { gql } from 'apollo-boost'

interface Season {
  id: number
  year: number
}

interface SeasonsData {
  seasons: Season[]
}

interface SeasonsProps {
  sport: string,
}

const GET_SEASONS = gql`
  {
    seasons {
      id
      year
    }
  }
`

const Seasons: React.FC<SeasonsProps> = ({ sport }) => {
  const { loading, error, data } = useQuery<SeasonsData>(GET_SEASONS)
  
  if (loading) return <p>Loading...</p>
  if (error) return <p>Error :(</p>
  if (!data) return null

  return (
    <div>
      <h1>{sport} Seasons</h1>
      <ul>
        {data.seasons.map(season =>  (
          <li key={season.id}>{ season.year }</li>
        ))}
      </ul>
    </div>
  )
}

export default Seasons
