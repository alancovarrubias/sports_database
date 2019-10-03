import React from 'react';
import { ApolloProvider } from '@apollo/react-hooks'
import client from './apollo-client'
import { Sports } from './types'
import Seasons from './components/Seasons'

const App: React.FC = () => (
  <ApolloProvider client={client}>
    <Seasons sport={Sports.NBA} />
  </ApolloProvider>
)

export default App;
