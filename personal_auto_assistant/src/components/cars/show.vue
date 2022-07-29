<script setup>
  import { ref } from 'vue' 

  const car = ref(
    {
      id: '2',
      user_id: '1',
      model: 'Prius',
      year_production: '2011',
      engine_volume: '1',
      mileage: '84949',
      body_type: 'Wagon',
      maker: 'Nissan',
      vin: 'M129K45C18T989430',
      created_at: '2022-06-01T16:11:53.615Z',
      updated_at: '2022-06-01T16:11:54.517Z',
      fuel_type: 'gas',
      transmission_type: 'mechanic'
    } 
  )
</script>

<template>
  <p>
    <strong>Model:</strong>
    {{ car.model }}
  </p>

  <p>
    <strong>Year production:</strong>
    {{ car.year_production }}
  </p>

  <p>
    <strong>Engine volume:</strong>
    {{ car.engine_volume }}
  </p>

  <p>
    <strong>Mileage:</strong>
    {{ car.mileage }}
  </p>

  <p>
    <strong>Body type:</strong>
    {{ car.body_type }}
  </p>

  <p>
    <strong>Fuel type:</strong>
    {{ car.fuel_type }}
  </p>

  <p>
    <strong>Transmission type:</strong>
    {{ car.transmission_type }}
  </p>

  <p>
    <strong>Maker:</strong>
    {{ car.maker }}
  </p>

  <p>
    <strong>Vin:</strong>
    {{ car.vin }}
  </p>
</template>