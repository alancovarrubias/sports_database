import React from 'react';
import Seasons from './components/Seasons'

const seasons = [
  { id: 1, year: 2019 },
  { id: 2, year: 2018 },
  { id: 3, year: 2017 },
]

const App: React.FC = () => {
  return (
    <Seasons sport='NBA' seasons={seasons} />
  )
}

export default App;
