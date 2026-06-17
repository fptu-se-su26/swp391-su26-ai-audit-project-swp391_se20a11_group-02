package com.swp391.coding_platform.dto.moderation;

import lombok.*;
import java.util.Collections;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GeminiEmbeddingRequest {
    private String model;
    private Content content;

    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Content {
        private List<Part> parts;
    }

    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Part {
        private String text;
    }

    public static GeminiEmbeddingRequest of(String text) {
        return GeminiEmbeddingRequest.builder()
                .model("models/text-embedding-004")
                .content(Content.builder()
                        .parts(Collections.singletonList(
                            Part.builder().text(text).build()
                        ))
                        .build())
                .build();
    }
}
