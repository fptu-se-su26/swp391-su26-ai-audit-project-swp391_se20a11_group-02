package com.swp391.coding_platform.security;

import jakarta.servlet.http.Cookie;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
import org.springframework.security.oauth2.server.resource.web.BearerTokenResolver;
import org.springframework.security.oauth2.server.resource.web.DefaultBearerTokenResolver;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SecurityConfig {

    final CustomJwtDecoder customJwtDecoder;
    final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    final JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Value("${cors.allowed-origins:http://localhost:5173,http://localhost:3000}")
    String allowedOrigins;

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                // Sử dụng CorsConfigurationSource bên dưới
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth -> auth
                        // 1. Cho phép tất cả request OPTIONS (Preflight) đi qua không bị chặn
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()

                        // 2. Các API xác thực (Auth)
                        .requestMatchers("/auth/**").permitAll()
                        .requestMatchers("/uploads/**").permitAll()

                        // 3. Các API Public
                        .requestMatchers(HttpMethod.GET, "/categories", "/courses/**", "/lessons/**").permitAll()
                        .requestMatchers(HttpMethod.GET, "/contests/**", "/rankings").permitAll()
                        .requestMatchers(HttpMethod.GET, "/api/problems").permitAll()
                        .requestMatchers("/online-judge/problems/practice").permitAll()

                        // 4. Các API Webhook / Callback
                        .requestMatchers("/payment/success.html", "/payment/cancel.html", "/payment/webhook").permitAll()
                        .requestMatchers(HttpMethod.PUT, "/online-judge/submissions/**", "/online-judge/webhooks/**").permitAll()

                        // 5. WebSocket & System
                        .requestMatchers("/test-ws.html", "/test-ws-gen.html", "/ws/**", "/test-progress", "/error").permitAll()

                        // 6. Tất cả các request còn lại đều yêu cầu xác thực
                        .anyRequest().authenticated()
                )
                .oauth2ResourceServer(oauth2 -> oauth2
                        .bearerTokenResolver(bearerTokenResolver())
                        .jwt(jwt -> jwt
                                .decoder(customJwtDecoder)
                                .jwtAuthenticationConverter(jwtAuthenticationConverter())
                        )
                        .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                        .accessDeniedHandler(jwtAccessDeniedHandler)
                );

        return http.build();
    }

    @Bean
    BearerTokenResolver bearerTokenResolver(){
        DefaultBearerTokenResolver defaultResolver = new DefaultBearerTokenResolver();
        return request -> {
            String path = request.getRequestURI();
            if (path.contains("/auth/login") || path.contains("/auth/register") || 
                path.contains("/auth/refresh") || path.contains("/auth/google") ||
                path.contains("/auth/forgot-password") || path.contains("/auth/verify-otp") ||
                path.contains("/auth/reset-password")) {
                return null;
            }

            String token = defaultResolver.resolve(request);

            if (token != null) {
                return token;
            }

            Cookie[] cookies = request.getCookies();

            if(cookies == null) {
                return null;
            }

            for (Cookie cookie : cookies){
                if("access_token".equals(cookie.getName())){
                    return cookie.getValue();
                }
            }
            return null;
        };
    }

    @Bean
    JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();
        jwtGrantedAuthoritiesConverter.setAuthorityPrefix("");

        JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(jwtGrantedAuthoritiesConverter);
        return jwtAuthenticationConverter;
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        if (allowedOrigins != null && !allowedOrigins.isEmpty()) {
            // Trim khoảng trắng thừa giữa các domain
            List<String> origins = Arrays.stream(allowedOrigins.split(","))
                    .map(String::trim)
                    .toList();
            configuration.setAllowedOrigins(origins);
        } else {
            configuration.setAllowedOrigins(List.of("http://localhost:3000", "http://localhost:5173", "https://nonstopcoding.io.vn", "https://www.nonstopcoding.io.vn"));
        }

        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        // Cho phép TẤT CẢ các header từ client gửi lên để không bị lỗi 403
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setExposedHeaders(List.of("Set-Cookie", "Authorization"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
