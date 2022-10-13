# banco-base
Ejercicio Practico de ABC de pagos con intregacion con kafka


Pasos Para ejecucion:

En raiz de proyecto :

1.- Ejecutar : docker.vectorized.io/vectorized/redpanda:v22.2.6
2.- Ejecutar :  docker compose up -d
    este comando ejecutara los servicios de generación de base de datos, app java y Kafka

3.- para ver la documentación de los servicios se integro la herramienta swagger (en lugar de los colecctions de postman) 
    para ver la documentación de los servicios la url es :  http://localhost:9750/base/services/swagger-ui.html#/

4.- para ver los logs de los servicios ejecutar: docker logs -f {base-app-1} logs de consumer y producer al ejecutar una actualizcion de estatus.

5.- dento de la raíz del proyecto se encuentra el archivo init.sql, por si se quiere ejecutar estos scripts en una base local.

6.- Definicion de Proucer y consumer:


@Configuration
public class KafkaStringConfig {

    public ProducerFactory<String, PagosDTO> producerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "PLAINTEXT://redpanda:9092");
        config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
        config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, JsonDeserializer.class);
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "PLAINTEXT://redpanda:9092");
        return new DefaultKafkaProducerFactory<>(config);
    }

    @Bean(name = "kafkaStringTemplate")
    public KafkaTemplate<String, PagosDTO> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }
}



@Component
@Slf4j
public class KafkaStringConsumer {


    @KafkaListener(topics = "TOPIC-DEMO" , groupId = "group_id")
    public void consume(String message) {
        log.info("Consuming Message {}", message);
    }

}



@Component
@Slf4j
public class KafkaStringProducer {


    private final KafkaTemplate<String, PagosDTO> kafkaTemplate;

    public KafkaStringProducer(@Qualifier("kafkaStringTemplate") KafkaTemplate<String, PagosDTO> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void sendMessage(PagosDTO message, String key) {
        log.info("Producing message {}", message);
        this.kafkaTemplate.send("TOPIC-DEMO", key, message);
    }

}
