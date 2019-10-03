export interface SeasonsComponentProps {
  sport: string,
  seasons: Array<Season>,
}

export interface Season {
  id: number,
  year: number,
}

