package com.swp391.coding_platform.configuration;

import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModerationQueueConfig {

    public static final String MODERATION_QUEUE = "course.moderation.queue";
    public static final String MODERATION_EXCHANGE = "course.moderation.exchange";
    public static final String MODERATION_ROUTING_KEY = "course.submitted";

    public static final String MODERATION_DLQ = "course.moderation.dlq";
    public static final String MODERATION_DLX = "course.moderation.dlx";
    public static final String MODERATION_DLQ_ROUTING_KEY = "course.moderation.dead";

    @Bean
    public Queue moderationQueue() {
        return QueueBuilder.durable(MODERATION_QUEUE)
                .withArgument("x-dead-letter-exchange", MODERATION_DLX)
                .withArgument("x-dead-letter-routing-key", MODERATION_DLQ_ROUTING_KEY)
                .build();
    }

    @Bean
    public Queue deadLetterQueue() {
        return QueueBuilder.durable(MODERATION_DLQ).build();
    }

    @Bean
    public DirectExchange moderationExchange() {
        return new DirectExchange(MODERATION_EXCHANGE);
    }

    @Bean
    public DirectExchange deadLetterExchange() {
        return new DirectExchange(MODERATION_DLX);
    }

    @Bean
    public Binding bindingModeration(Queue moderationQueue, DirectExchange moderationExchange) {
        return BindingBuilder.bind(moderationQueue).to(moderationExchange).with(MODERATION_ROUTING_KEY);
    }

    @Bean
    public Binding bindingDLQ(Queue deadLetterQueue, DirectExchange deadLetterExchange) {
        return BindingBuilder.bind(deadLetterQueue).to(deadLetterExchange).with(MODERATION_DLQ_ROUTING_KEY);
    }
}
