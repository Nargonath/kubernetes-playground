'use strict';

module.exports = {
  method: 'GET',
  path: '/random-number',
  options: {
    handler: (request, h) => {
      return Math.round(Math.random() * 1000);
    },
  },
};
