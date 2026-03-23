## Vector DB Use Case

A traditional keyword-based search would not be enough for a law firm searching 500-page contracts using plain English questions. Keyword search depends on exact words. But in legal documents, the same meaning can be written in different ways. For example, a lawyer may ask about “termination clauses,” while the contract may use words like “ending the agreement” or “right to terminate.” In that case, keyword search may miss useful results.

A vector database helps by storing embeddings of contract paragraphs or clauses. Embeddings represent the meaning of the text, not only the exact words. When the lawyer asks a question, that question is also turned into an embedding. The system then compares the question with stored contract embeddings and finds the most similar parts.

So, the vector database is important because it supports semantic search. It helps the system find relevant contract sections even when the wording is different. The best system would usually combine both keyword search and vector search.
