/**
 * Fetches tool data from the bio.tools API
 * @param {string} id - The tool ID to query
 * @returns {Promise<Object>} The tool data from the API
 * @throws {Error} If the API request fails
 */
async function getBiotoolsData(id) {
  if (!id) {
    throw new Error('Tool ID is required');
  }

  const url = `https://bio.tools/api/${id}`;

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Accept': 'application/json'
      }
    });

    if (!response.ok) {
      throw new Error(`API request failed with status ${response.status}: ${response.statusText}`);
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching bio.tools data:', error);
    throw error;
  }
}
