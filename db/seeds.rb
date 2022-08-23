# frozen_string_literal: true
data_type = DataType.create(name_type: 'Public')

DataIp.create([
                {
                  ip_address: '194.191.247.83',
                  ip_type: 'ipv4',
                  continent_code: 'EU',
                  continent_name: 'Europe',
                  country_code: 'CH',
                  country_name: 'Switzerland',
                  region_code: 'ZH',
                  region_name: 'Zurich',
                  city: 'Zürich',
                  zip: 8043,
                  data_type_id: data_type.id
                },
                {
                  ip_address: '160.39.144.19',
                  ip_type: 'ipv4',
                  continent_code: 'NA',
                  continent_name: 'North America',
                  country_code: 'US',
                  country_name: 'United States',
                  region_code: 'NYC',
                  region_name: 'New York',
                  city: 'Manhattan',
                  zip: 10_025,
                  data_type_id: data_type.id
                },
                {
                  ip_address: '134.201.250.155',
                  ip_type: 'ipv4',
                  continent_code: 'NA',
                  continent_name: 'North America',
                  country_code: 'US',
                  country_name: 'United States',
                  region_code: 'CA',
                  region_name: 'California',
                  city: 'Zürich',
                  zip: 8043,
                  data_type_id: data_type.id
                }
              ])

