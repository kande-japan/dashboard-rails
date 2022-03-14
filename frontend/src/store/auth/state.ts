export interface IAuthState {
  access: string;
  accessExpiresAtSec: number | null;
  refresh: string;
  refreshExpiresAtSec: number | null;
}

function state(): IAuthState {
  return {
    access: '',
    accessExpiresAtSec: null,
    refresh: '',
    refreshExpiresAtSec: null,
  };
}

export default state;
