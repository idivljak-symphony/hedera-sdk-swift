/// Response from ``Transaction.execute``.
///
/// When the client sends a node a transaction of any kind, the node replies with this, which
/// simply says that the transaction passed the pre-check (so the node will submit it to
/// the network).
///
/// To learn the consensus result, the client should later obtain a
/// receipt (free), or can buy a more detailed record (not free).
///
public struct TransactionResponse: Decodable {
    /// The account ID of the node that the transaction was submitted to.
    public let nodeAccountId: AccountId

    /// The client-generated transaction ID of the transaction that was submitted.
    ///
    /// This can be used to lookup the transaction in an explorer.
    ///
    public let transactionId: String
    // TODO: Use `TransactionId` type

    /// The client-generated SHA-384 hash of the transaction that was submitted.
    ///
    /// This can be used to lookup the transaction in an explorer.
    ///
    public let transactionHash: String
    // TODO: Use `TransactionHash` type

    /// Get the receipt of this transaction.
    /// Will wait for consensus.
    /// Will return a `receiptStatus` error for a failing receipt.
    public func getReceipt(_ client: Client) async throws -> TransactionReceipt {
        let receipt = try await TransactionReceiptQuery()
            .transactionId(transactionId)
            // TODO: .nodeAccountIds([nodeAccountId])
            .validateStatus(true)
            .execute(client)

        return receipt
    }
}
