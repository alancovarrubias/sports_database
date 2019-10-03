const { ApolloServer, gql } = require('apollo-server')
const NbaAPI = require('./NbaAPI')

// A schema is a collection of type definitions (hence "typeDefs")
// that together define the "shape" of queries that are executed against
// your data.
const typeDefs = gql`
  # Comments in GraphQL strings (such as this one) start with the hash (#) symbol.

  # This "Season" type defines the queryable fields for every season in our data source.
  type Season {
    id: ID
    year: Int
  }

  # The "Query" type is special: it lists all of the available queries that
  # clients can execute, along with the return type for each. In this
  # case, the "seasons" query returns an array of zero or more Seasons (defined above).
  type Query {
    seasons: [Season]
  }
`
// Resolvers define the technique for fetching the types defined in the
// schema. This resolver retrieves seasons from the "seasons" array above.
const resolvers = {
  Query: {
    seasons: (_sources, _args, { dataSources }) => dataSources.nbaAPI.getSeasons()
  },
};

const dataSources = () => {
  return {
    nbaAPI: new NbaAPI(),
  }
}
// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({ typeDefs, resolvers, dataSources })

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`)
})
