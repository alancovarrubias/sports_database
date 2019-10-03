const { RESTDataSource } = require('apollo-datasource-rest')

class NbaAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = 'http://localhost:3000/api/';
  }

  async getSeasons() {
    return this.get(`seasons`);
  }

  async getSeason(id) {
    return this.get(`seasons/${id}`);
  }
}

module.exports = NbaAPI
