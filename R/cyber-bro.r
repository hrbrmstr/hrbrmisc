# nolint start

#' Bro conn-log connection state values and descriptions
#'
#' Quick ref:
#'
#' \preformatted{
#'     S0  Connection attempt seen, no reply.
#'     S1  Connection established, not terminated.
#'     SF  Normal establishment and termination. Note that this is the
#'         same symbol as for state S1. You can tell the two apart because
#'         for S1 there will not be any byte counts in the summary, while
#'         for SF there will be.
#'    REJ  Connection attempt rejected.
#'     S2  Connection established and close attempt by originator seen
#'         (but no reply from responder).
#'     S3  Connection established and close attempt by responder seen
#'         (but no reply from originator).
#'   RSTO  Connection established, originator aborted (sent a RST).
#'   RSTR  Responder sent a RST.
#' RSTOS0  Originator sent a SYN followed by a RST, we never saw a
#'         SYN-ACK from the responder.
#'  RSTRH  Responder sent a SYN ACK followed by a RST, we never saw a SYN
#'         from the (purported) originator.
#'     SH  Originator sent a SYN followed by a FIN, we never saw a SYN ACK
#'         from the responder (hence the connection was “half” open).
#'    SHR Responder sent a SYN ACK followed by a FIN, we never saw a SYN
#'        from the originator.
#'    OTH No SYN seen, just midstream traffic (a “partial connection” that
#'        was not later closed).
#' }
#' @export
data.frame(
  state=c("S0", "S1", "SF", "REJ", "S2", "S3", "RSTO", "RSTR", "RSTOS0", "RSTRH", "SH", "SHR", "OTH"),
  descr=c("Connection attempt seen, no reply.",
    "Connection established, not terminated.",
    "Normal establishment and termination. Note that this is the same symbol as for state S1. You can tell the two apart because for S1 there will not be any byte counts in the summary, while for SF there will be.",
    "Connection attempt rejected.",
    "Connection established and close attempt by originator seen (but no reply from responder).",
    "Connection established and close attempt by responder seen (but no reply from originator).",
    "Connection established, originator aborted (sent a RST).",
    "Responder sent a RST.",
    "Originator sent a SYN followed by a RST, we never saw a SYN-ACK from the responder.",
    "Responder sent a SYN ACK followed by a RST, we never saw a SYN from the (purported) originator.",
    "Originator sent a SYN followed by a FIN, we never saw a SYN ACK from the responder (hence the connection was “half” open).",
    "Responder sent a SYN ACK followed by a FIN, we never saw a SYN from the originator.",
    "No SYN seen, just midstream traffic (a 'partial connection' that was not later closed'")
) -> bro_conn_states


# nolint end