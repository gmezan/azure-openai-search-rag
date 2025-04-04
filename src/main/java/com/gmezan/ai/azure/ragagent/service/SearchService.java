package com.gmezan.ai.azure.ragagent.service;

import com.gmezan.ai.azure.ragagent.model.search.RagDocument;
import reactor.core.publisher.Flux;

public interface SearchService {
	Flux<RagDocument> search(String query);

}
