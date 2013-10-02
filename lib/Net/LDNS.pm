package Net::LDNS;

use 5.014002;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

our %EXPORT_TAGS = ( 'all' => [ qw(
	LDNS_AA
	LDNS_AD
	LDNS_CD
	LDNS_CERT_ACPKIX
	LDNS_CERT_IACPKIX
	LDNS_CERT_IPGP
	LDNS_CERT_IPKIX
	LDNS_CERT_ISPKI
	LDNS_CERT_OID
	LDNS_CERT_PGP
	LDNS_CERT_PKIX
	LDNS_CERT_SPKI
	LDNS_CERT_URI
	LDNS_DEFAULT_EXP_TIME
	LDNS_DEFAULT_TTL
	LDNS_DH
	LDNS_DNSSEC_KEYPROTO
	LDNS_DSA
	LDNS_DSA_NSEC3
	LDNS_ECC
	LDNS_ECC_GOST
	LDNS_HASH_GOST
	LDNS_IP4ADDRLEN
	LDNS_IP6ADDRLEN
	LDNS_KEY_REVOKE_KEY
	LDNS_KEY_SEP_KEY
	LDNS_KEY_ZONE_KEY
	LDNS_MAX_DOMAINLEN
	LDNS_MAX_KEYLEN
	LDNS_MAX_LABELLEN
	LDNS_MAX_PACKETLEN
	LDNS_MAX_POINTERS
	LDNS_MAX_RDFLEN
	LDNS_NSEC3_MAX_ITERATIONS
	LDNS_NSEC3_VARS_OPTOUT_MASK
	LDNS_PACKET_ANSWER
	LDNS_PACKET_IQUERY
	LDNS_PACKET_NODATA
	LDNS_PACKET_NOTIFY
	LDNS_PACKET_NXDOMAIN
	LDNS_PACKET_QUERY
	LDNS_PACKET_QUESTION
	LDNS_PACKET_REFERRAL
	LDNS_PACKET_STATUS
	LDNS_PACKET_UNKNOWN
	LDNS_PACKET_UPDATE
	LDNS_PORT
	LDNS_PRIVATEDNS
	LDNS_PRIVATEOID
	LDNS_QR
	LDNS_RA
	LDNS_RCODE_FORMERR
	LDNS_RCODE_NOERROR
	LDNS_RCODE_NOTAUTH
	LDNS_RCODE_NOTIMPL
	LDNS_RCODE_NOTZONE
	LDNS_RCODE_NXDOMAIN
	LDNS_RCODE_NXRRSET
	LDNS_RCODE_REFUSED
	LDNS_RCODE_SERVFAIL
	LDNS_RCODE_YXDOMAIN
	LDNS_RCODE_YXRRSET
	LDNS_RD
	LDNS_RDATA_FIELD_DESCRIPTORS_COMMON
	LDNS_RDF_SIZE_16BYTES
	LDNS_RDF_SIZE_6BYTES
	LDNS_RDF_SIZE_BYTE
	LDNS_RDF_SIZE_DOUBLEWORD
	LDNS_RDF_SIZE_WORD
	LDNS_RDF_TYPE_A
	LDNS_RDF_TYPE_AAAA
	LDNS_RDF_TYPE_ALG
	LDNS_RDF_TYPE_APL
	LDNS_RDF_TYPE_ATMA
	LDNS_RDF_TYPE_B32_EXT
	LDNS_RDF_TYPE_B64
	LDNS_RDF_TYPE_CERT_ALG
	LDNS_RDF_TYPE_CLASS
	LDNS_RDF_TYPE_DNAME
	LDNS_RDF_TYPE_HEX
	LDNS_RDF_TYPE_INT16
	LDNS_RDF_TYPE_INT16_DATA
	LDNS_RDF_TYPE_INT32
	LDNS_RDF_TYPE_INT8
	LDNS_RDF_TYPE_IPSECKEY
	LDNS_RDF_TYPE_LOC
	LDNS_RDF_TYPE_NONE
	LDNS_RDF_TYPE_NSAP
	LDNS_RDF_TYPE_NSEC
	LDNS_RDF_TYPE_NSEC3_NEXT_OWNER
	LDNS_RDF_TYPE_NSEC3_SALT
	LDNS_RDF_TYPE_PERIOD
	LDNS_RDF_TYPE_SERVICE
	LDNS_RDF_TYPE_STR
	LDNS_RDF_TYPE_TIME
	LDNS_RDF_TYPE_HIP
	LDNS_RDF_TYPE_TSIGTIME
	LDNS_RDF_TYPE_TYPE
	LDNS_RDF_TYPE_UNKNOWN
	LDNS_RDF_TYPE_WKS
	LDNS_RESOLV_ANCHOR
	LDNS_RESOLV_DEFDOMAIN
	LDNS_RESOLV_INET
	LDNS_RESOLV_INET6
	LDNS_RESOLV_INETANY
	LDNS_RESOLV_KEYWORD
	LDNS_RESOLV_KEYWORDS
	LDNS_RESOLV_NAMESERVER
	LDNS_RESOLV_OPTIONS
	LDNS_RESOLV_RTT_INF
	LDNS_RESOLV_RTT_MIN
	LDNS_RESOLV_SEARCH
	LDNS_RESOLV_SORTLIST
	LDNS_RR_CLASS_ANY
	LDNS_RR_CLASS_CH
	LDNS_RR_CLASS_COUNT
	LDNS_RR_CLASS_FIRST
	LDNS_RR_CLASS_HS
	LDNS_RR_CLASS_IN
	LDNS_RR_CLASS_LAST
	LDNS_RR_CLASS_NONE
	LDNS_RR_COMPRESS
	LDNS_RR_NO_COMPRESS
	LDNS_RR_OVERHEAD
	LDNS_RR_TYPE_A
	LDNS_RR_TYPE_A6
	LDNS_RR_TYPE_AAAA
	LDNS_RR_TYPE_AFSDB
	LDNS_RR_TYPE_ANY
	LDNS_RR_TYPE_APL
	LDNS_RR_TYPE_ATMA
	LDNS_RR_TYPE_AXFR
	LDNS_RR_TYPE_CERT
	LDNS_RR_TYPE_CNAME
	LDNS_RR_TYPE_COUNT
	LDNS_RR_TYPE_DHCID
	LDNS_RR_TYPE_DLV
	LDNS_RR_TYPE_DNAME
	LDNS_RR_TYPE_DNSKEY
	LDNS_RR_TYPE_DS
	LDNS_RR_TYPE_EID
	LDNS_RR_TYPE_FIRST
	LDNS_RR_TYPE_GID
	LDNS_RR_TYPE_GPOS
	LDNS_RR_TYPE_HINFO
	LDNS_RR_TYPE_IPSECKEY
	LDNS_RR_TYPE_ISDN
	LDNS_RR_TYPE_IXFR
	LDNS_RR_TYPE_KEY
	LDNS_RR_TYPE_KX
	LDNS_RR_TYPE_LAST
	LDNS_RR_TYPE_LOC
	LDNS_RR_TYPE_MAILA
	LDNS_RR_TYPE_MAILB
	LDNS_RR_TYPE_MB
	LDNS_RR_TYPE_MD
	LDNS_RR_TYPE_MF
	LDNS_RR_TYPE_MG
	LDNS_RR_TYPE_MINFO
	LDNS_RR_TYPE_MR
	LDNS_RR_TYPE_MX
	LDNS_RR_TYPE_NAPTR
	LDNS_RR_TYPE_NIMLOC
	LDNS_RR_TYPE_NS
	LDNS_RR_TYPE_NSAP
	LDNS_RR_TYPE_NSAP_PTR
	LDNS_RR_TYPE_NSEC
	LDNS_RR_TYPE_NSEC3
	LDNS_RR_TYPE_NSEC3PARAM
	LDNS_RR_TYPE_NSEC3PARAMS
	LDNS_RR_TYPE_NULL
	LDNS_RR_TYPE_NXT
	LDNS_RR_TYPE_OPT
	LDNS_RR_TYPE_PTR
	LDNS_RR_TYPE_PX
	LDNS_RR_TYPE_RP
	LDNS_RR_TYPE_RRSIG
	LDNS_RR_TYPE_RT
	LDNS_RR_TYPE_SIG
	LDNS_RR_TYPE_SINK
	LDNS_RR_TYPE_SOA
	LDNS_RR_TYPE_SPF
	LDNS_RR_TYPE_SRV
	LDNS_RR_TYPE_SSHFP
	LDNS_RR_TYPE_TALINK
	LDNS_RR_TYPE_TSIG
	LDNS_RR_TYPE_TXT
	LDNS_RR_TYPE_UID
	LDNS_RR_TYPE_UINFO
	LDNS_RR_TYPE_UNSPEC
	LDNS_RR_TYPE_WKS
	LDNS_RR_TYPE_X25
	LDNS_RSAMD5
	LDNS_RSASHA1
	LDNS_RSASHA1_NSEC3
	LDNS_RSASHA256
	LDNS_RSASHA512
	LDNS_SECTION_ADDITIONAL
	LDNS_SECTION_ANSWER
	LDNS_SECTION_ANY
	LDNS_SECTION_ANY_NOQUESTION
	LDNS_SECTION_AUTHORITY
	LDNS_SECTION_QUESTION
	LDNS_SHA1
	LDNS_SHA256
	LDNS_SIGNATURE_LEAVE_ADD_NEW
	LDNS_SIGNATURE_LEAVE_NO_ADD
	LDNS_SIGNATURE_REMOVE_ADD_NEW
	LDNS_SIGNATURE_REMOVE_NO_ADD
	LDNS_SIGN_DSA
	LDNS_SIGN_DSA_NSEC3
	LDNS_SIGN_ECC_GOST
	LDNS_SIGN_HMACSHA1
	LDNS_SIGN_HMACSHA256
	LDNS_SIGN_RSAMD5
	LDNS_SIGN_RSASHA1
	LDNS_SIGN_RSASHA1_NSEC3
	LDNS_SIGN_RSASHA256
	LDNS_SIGN_RSASHA512
	LDNS_STATUS_ADDRESS_ERR
	LDNS_STATUS_CERT_BAD_ALGORITHM
	LDNS_STATUS_CRYPTO_ALGO_NOT_IMPL
	LDNS_STATUS_CRYPTO_BOGUS
	LDNS_STATUS_CRYPTO_EXPIRATION_BEFORE_INCEPTION
	LDNS_STATUS_CRYPTO_NO_DNSKEY
	LDNS_STATUS_CRYPTO_NO_DS
	LDNS_STATUS_CRYPTO_NO_MATCHING_KEYTAG_DNSKEY
	LDNS_STATUS_CRYPTO_NO_RRSIG
	LDNS_STATUS_CRYPTO_NO_TRUSTED_DNSKEY
	LDNS_STATUS_CRYPTO_NO_TRUSTED_DS
	LDNS_STATUS_CRYPTO_SIG_EXPIRED
	LDNS_STATUS_CRYPTO_SIG_NOT_INCEPTED
	LDNS_STATUS_CRYPTO_TSIG_BOGUS
	LDNS_STATUS_CRYPTO_TSIG_ERR
	LDNS_STATUS_CRYPTO_TYPE_COVERED_ERR
	LDNS_STATUS_CRYPTO_UNKNOWN_ALGO
	LDNS_STATUS_CRYPTO_VALIDATED
	LDNS_STATUS_DDD_OVERFLOW
	LDNS_STATUS_DNSSEC_EXISTENCE_DENIED
	LDNS_STATUS_DNSSEC_NSEC3_ORIGINAL_NOT_FOUND
	LDNS_STATUS_DNSSEC_NSEC_RR_NOT_COVERED
	LDNS_STATUS_DNSSEC_NSEC_WILDCARD_NOT_COVERED
	LDNS_STATUS_DOMAINNAME_OVERFLOW
	LDNS_STATUS_DOMAINNAME_UNDERFLOW
	LDNS_STATUS_EMPTY_LABEL
	LDNS_STATUS_ENGINE_KEY_NOT_LOADED
	LDNS_STATUS_ERR
	LDNS_STATUS_FILE_ERR
	LDNS_STATUS_INTERNAL_ERR
	LDNS_STATUS_INVALID_B32_EXT
	LDNS_STATUS_INVALID_B64
	LDNS_STATUS_INVALID_HEX
	LDNS_STATUS_INVALID_INT
	LDNS_STATUS_INVALID_IP4
	LDNS_STATUS_INVALID_IP6
	LDNS_STATUS_INVALID_POINTER
	LDNS_STATUS_INVALID_STR
	LDNS_STATUS_INVALID_TIME
	LDNS_STATUS_LABEL_OVERFLOW
	LDNS_STATUS_MEM_ERR
	LDNS_STATUS_MISSING_RDATA_FIELDS_KEY
	LDNS_STATUS_MISSING_RDATA_FIELDS_RRSIG
	LDNS_STATUS_NETWORK_ERR
	LDNS_STATUS_NOT_IMPL
	LDNS_STATUS_NO_DATA
	LDNS_STATUS_NSEC3_ERR
	LDNS_STATUS_NULL
	LDNS_STATUS_OK
	LDNS_STATUS_PACKET_OVERFLOW
	LDNS_STATUS_RES_NO_NS
	LDNS_STATUS_RES_QUERY
	LDNS_STATUS_SOCKET_ERROR
	LDNS_STATUS_SSL_ERR
	LDNS_STATUS_SYNTAX_ALG_ERR
	LDNS_STATUS_SYNTAX_BAD_ESCAPE
	LDNS_STATUS_SYNTAX_CLASS_ERR
	LDNS_STATUS_SYNTAX_DNAME_ERR
	LDNS_STATUS_SYNTAX_EMPTY
	LDNS_STATUS_SYNTAX_ERR
	LDNS_STATUS_SYNTAX_INCLUDE
	LDNS_STATUS_SYNTAX_INCLUDE_ERR_NOTIMPL
	LDNS_STATUS_SYNTAX_INTEGER_OVERFLOW
	LDNS_STATUS_SYNTAX_ITERATIONS_OVERFLOW
	LDNS_STATUS_SYNTAX_KEYWORD_ERR
	LDNS_STATUS_SYNTAX_MISSING_VALUE_ERR
	LDNS_STATUS_SYNTAX_ORIGIN
	LDNS_STATUS_SYNTAX_RDATA_ERR
	LDNS_STATUS_SYNTAX_TTL
	LDNS_STATUS_SYNTAX_TTL_ERR
	LDNS_STATUS_SYNTAX_TYPE_ERR
	LDNS_STATUS_SYNTAX_VERSION_ERR
	LDNS_STATUS_UNKNOWN_INET
	LDNS_STATUS_WIRE_INCOMPLETE_ADDITIONAL
	LDNS_STATUS_WIRE_INCOMPLETE_ANSWER
	LDNS_STATUS_WIRE_INCOMPLETE_AUTHORITY
	LDNS_STATUS_WIRE_INCOMPLETE_HEADER
	LDNS_STATUS_WIRE_INCOMPLETE_QUESTION
	LDNS_TC

	dnssec_create_nsec
	dnssec_create_nsec3
	create_nsec
	create_nsec3

	rr_type2str
	rr_class2str
	rr_type_by_name
	rr_class_by_name
        pkt_opcode2str
        pkt_rcode2str

	errorstr_by_id
	signing_algorithm_by_name
	key_algorithm_supported
	read_anchor_file
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	LDNS_AA
	LDNS_AD
	LDNS_CD
	LDNS_CERT_ACPKIX
	LDNS_CERT_IACPKIX
	LDNS_CERT_IPGP
	LDNS_CERT_IPKIX
	LDNS_CERT_ISPKI
	LDNS_CERT_OID
	LDNS_CERT_PGP
	LDNS_CERT_PKIX
	LDNS_CERT_SPKI
	LDNS_CERT_URI
	LDNS_DEFAULT_EXP_TIME
	LDNS_DEFAULT_TTL
	LDNS_DH
	LDNS_DNSSEC_KEYPROTO
	LDNS_DSA
	LDNS_DSA_NSEC3
	LDNS_ECC
	LDNS_ECC_GOST
	LDNS_HASH_GOST
	LDNS_IP4ADDRLEN
	LDNS_IP6ADDRLEN
	LDNS_KEY_REVOKE_KEY
	LDNS_KEY_SEP_KEY
	LDNS_KEY_ZONE_KEY
	LDNS_MAX_DOMAINLEN
	LDNS_MAX_KEYLEN
	LDNS_MAX_LABELLEN
	LDNS_MAX_PACKETLEN
	LDNS_MAX_POINTERS
	LDNS_MAX_RDFLEN
	LDNS_NSEC3_MAX_ITERATIONS
	LDNS_NSEC3_VARS_OPTOUT_MASK
	LDNS_PACKET_ANSWER
	LDNS_PACKET_IQUERY
	LDNS_PACKET_NODATA
	LDNS_PACKET_NOTIFY
	LDNS_PACKET_NXDOMAIN
	LDNS_PACKET_QUERY
	LDNS_PACKET_QUESTION
	LDNS_PACKET_REFERRAL
	LDNS_PACKET_STATUS
	LDNS_PACKET_UNKNOWN
	LDNS_PACKET_UPDATE
	LDNS_PORT
	LDNS_PRIVATEDNS
	LDNS_PRIVATEOID
	LDNS_QR
	LDNS_RA
	LDNS_RCODE_FORMERR
	LDNS_RCODE_NOERROR
	LDNS_RCODE_NOTAUTH
	LDNS_RCODE_NOTIMPL
	LDNS_RCODE_NOTZONE
	LDNS_RCODE_NXDOMAIN
	LDNS_RCODE_NXRRSET
	LDNS_RCODE_REFUSED
	LDNS_RCODE_SERVFAIL
	LDNS_RCODE_YXDOMAIN
	LDNS_RCODE_YXRRSET
	LDNS_RD
	LDNS_RDATA_FIELD_DESCRIPTORS_COMMON
	LDNS_RDF_SIZE_16BYTES
	LDNS_RDF_SIZE_6BYTES
	LDNS_RDF_SIZE_BYTE
	LDNS_RDF_SIZE_DOUBLEWORD
	LDNS_RDF_SIZE_WORD
	LDNS_RDF_TYPE_A
	LDNS_RDF_TYPE_AAAA
	LDNS_RDF_TYPE_ALG
	LDNS_RDF_TYPE_APL
	LDNS_RDF_TYPE_ATMA
	LDNS_RDF_TYPE_B32_EXT
	LDNS_RDF_TYPE_B64
	LDNS_RDF_TYPE_CERT_ALG
	LDNS_RDF_TYPE_CLASS
	LDNS_RDF_TYPE_DNAME
	LDNS_RDF_TYPE_HEX
	LDNS_RDF_TYPE_INT16
	LDNS_RDF_TYPE_INT16_DATA
	LDNS_RDF_TYPE_INT32
	LDNS_RDF_TYPE_INT8
	LDNS_RDF_TYPE_IPSECKEY
	LDNS_RDF_TYPE_LOC
	LDNS_RDF_TYPE_NONE
	LDNS_RDF_TYPE_NSAP
	LDNS_RDF_TYPE_NSEC
	LDNS_RDF_TYPE_NSEC3_NEXT_OWNER
	LDNS_RDF_TYPE_NSEC3_SALT
	LDNS_RDF_TYPE_PERIOD
	LDNS_RDF_TYPE_SERVICE
	LDNS_RDF_TYPE_STR
	LDNS_RDF_TYPE_TIME
	LDNS_RDF_TYPE_HIP
	LDNS_RDF_TYPE_TSIGTIME
	LDNS_RDF_TYPE_TYPE
	LDNS_RDF_TYPE_UNKNOWN
	LDNS_RDF_TYPE_WKS
	LDNS_RESOLV_ANCHOR
	LDNS_RESOLV_DEFDOMAIN
	LDNS_RESOLV_INET
	LDNS_RESOLV_INET6
	LDNS_RESOLV_INETANY
	LDNS_RESOLV_KEYWORD
	LDNS_RESOLV_KEYWORDS
	LDNS_RESOLV_NAMESERVER
	LDNS_RESOLV_OPTIONS
	LDNS_RESOLV_RTT_INF
	LDNS_RESOLV_RTT_MIN
	LDNS_RESOLV_SEARCH
	LDNS_RESOLV_SORTLIST
	LDNS_RR_CLASS_ANY
	LDNS_RR_CLASS_CH
	LDNS_RR_CLASS_COUNT
	LDNS_RR_CLASS_FIRST
	LDNS_RR_CLASS_HS
	LDNS_RR_CLASS_IN
	LDNS_RR_CLASS_LAST
	LDNS_RR_CLASS_NONE
	LDNS_RR_COMPRESS
	LDNS_RR_NO_COMPRESS
	LDNS_RR_OVERHEAD
	LDNS_RR_TYPE_A
	LDNS_RR_TYPE_A6
	LDNS_RR_TYPE_AAAA
	LDNS_RR_TYPE_AFSDB
	LDNS_RR_TYPE_ANY
	LDNS_RR_TYPE_APL
	LDNS_RR_TYPE_ATMA
	LDNS_RR_TYPE_AXFR
	LDNS_RR_TYPE_CERT
	LDNS_RR_TYPE_CNAME
	LDNS_RR_TYPE_COUNT
	LDNS_RR_TYPE_DHCID
	LDNS_RR_TYPE_DLV
	LDNS_RR_TYPE_DNAME
	LDNS_RR_TYPE_DNSKEY
	LDNS_RR_TYPE_DS
	LDNS_RR_TYPE_EID
	LDNS_RR_TYPE_FIRST
	LDNS_RR_TYPE_GID
	LDNS_RR_TYPE_GPOS
	LDNS_RR_TYPE_HINFO
	LDNS_RR_TYPE_IPSECKEY
	LDNS_RR_TYPE_ISDN
	LDNS_RR_TYPE_IXFR
	LDNS_RR_TYPE_KEY
	LDNS_RR_TYPE_KX
	LDNS_RR_TYPE_LAST
	LDNS_RR_TYPE_LOC
	LDNS_RR_TYPE_MAILA
	LDNS_RR_TYPE_MAILB
	LDNS_RR_TYPE_MB
	LDNS_RR_TYPE_MD
	LDNS_RR_TYPE_MF
	LDNS_RR_TYPE_MG
	LDNS_RR_TYPE_MINFO
	LDNS_RR_TYPE_MR
	LDNS_RR_TYPE_MX
	LDNS_RR_TYPE_NAPTR
	LDNS_RR_TYPE_NIMLOC
	LDNS_RR_TYPE_NS
	LDNS_RR_TYPE_NSAP
	LDNS_RR_TYPE_NSAP_PTR
	LDNS_RR_TYPE_NSEC
	LDNS_RR_TYPE_NSEC3
	LDNS_RR_TYPE_NSEC3PARAM
	LDNS_RR_TYPE_NSEC3PARAMS
	LDNS_RR_TYPE_NULL
	LDNS_RR_TYPE_NXT
	LDNS_RR_TYPE_OPT
	LDNS_RR_TYPE_PTR
	LDNS_RR_TYPE_PX
	LDNS_RR_TYPE_RP
	LDNS_RR_TYPE_RRSIG
	LDNS_RR_TYPE_RT
	LDNS_RR_TYPE_SIG
	LDNS_RR_TYPE_SINK
	LDNS_RR_TYPE_SOA
	LDNS_RR_TYPE_SPF
	LDNS_RR_TYPE_SRV
	LDNS_RR_TYPE_SSHFP
	LDNS_RR_TYPE_TALINK
	LDNS_RR_TYPE_TSIG
	LDNS_RR_TYPE_TXT
	LDNS_RR_TYPE_UID
	LDNS_RR_TYPE_UINFO
	LDNS_RR_TYPE_UNSPEC
	LDNS_RR_TYPE_WKS
	LDNS_RR_TYPE_X25
	LDNS_RSAMD5
	LDNS_RSASHA1
	LDNS_RSASHA1_NSEC3
	LDNS_RSASHA256
	LDNS_RSASHA512
	LDNS_SECTION_ADDITIONAL
	LDNS_SECTION_ANSWER
	LDNS_SECTION_ANY
	LDNS_SECTION_ANY_NOQUESTION
	LDNS_SECTION_AUTHORITY
	LDNS_SECTION_QUESTION
	LDNS_SHA1
	LDNS_SHA256
	LDNS_SIGNATURE_LEAVE_ADD_NEW
	LDNS_SIGNATURE_LEAVE_NO_ADD
	LDNS_SIGNATURE_REMOVE_ADD_NEW
	LDNS_SIGNATURE_REMOVE_NO_ADD
	LDNS_SIGN_DSA
	LDNS_SIGN_DSA_NSEC3
	LDNS_SIGN_ECC_GOST
	LDNS_SIGN_HMACSHA1
	LDNS_SIGN_HMACSHA256
	LDNS_SIGN_RSAMD5
	LDNS_SIGN_RSASHA1
	LDNS_SIGN_RSASHA1_NSEC3
	LDNS_SIGN_RSASHA256
	LDNS_SIGN_RSASHA512
	LDNS_STATUS_ADDRESS_ERR
	LDNS_STATUS_CERT_BAD_ALGORITHM
	LDNS_STATUS_CRYPTO_ALGO_NOT_IMPL
	LDNS_STATUS_CRYPTO_BOGUS
	LDNS_STATUS_CRYPTO_EXPIRATION_BEFORE_INCEPTION
	LDNS_STATUS_CRYPTO_NO_DNSKEY
	LDNS_STATUS_CRYPTO_NO_DS
	LDNS_STATUS_CRYPTO_NO_MATCHING_KEYTAG_DNSKEY
	LDNS_STATUS_CRYPTO_NO_RRSIG
	LDNS_STATUS_CRYPTO_NO_TRUSTED_DNSKEY
	LDNS_STATUS_CRYPTO_NO_TRUSTED_DS
	LDNS_STATUS_CRYPTO_SIG_EXPIRED
	LDNS_STATUS_CRYPTO_SIG_NOT_INCEPTED
	LDNS_STATUS_CRYPTO_TSIG_BOGUS
	LDNS_STATUS_CRYPTO_TSIG_ERR
	LDNS_STATUS_CRYPTO_TYPE_COVERED_ERR
	LDNS_STATUS_CRYPTO_UNKNOWN_ALGO
	LDNS_STATUS_CRYPTO_VALIDATED
	LDNS_STATUS_DDD_OVERFLOW
	LDNS_STATUS_DNSSEC_EXISTENCE_DENIED
	LDNS_STATUS_DNSSEC_NSEC3_ORIGINAL_NOT_FOUND
	LDNS_STATUS_DNSSEC_NSEC_RR_NOT_COVERED
	LDNS_STATUS_DNSSEC_NSEC_WILDCARD_NOT_COVERED
	LDNS_STATUS_DOMAINNAME_OVERFLOW
	LDNS_STATUS_DOMAINNAME_UNDERFLOW
	LDNS_STATUS_EMPTY_LABEL
	LDNS_STATUS_ENGINE_KEY_NOT_LOADED
	LDNS_STATUS_ERR
	LDNS_STATUS_FILE_ERR
	LDNS_STATUS_INTERNAL_ERR
	LDNS_STATUS_INVALID_B32_EXT
	LDNS_STATUS_INVALID_B64
	LDNS_STATUS_INVALID_HEX
	LDNS_STATUS_INVALID_INT
	LDNS_STATUS_INVALID_IP4
	LDNS_STATUS_INVALID_IP6
	LDNS_STATUS_INVALID_POINTER
	LDNS_STATUS_INVALID_STR
	LDNS_STATUS_INVALID_TIME
	LDNS_STATUS_LABEL_OVERFLOW
	LDNS_STATUS_MEM_ERR
	LDNS_STATUS_MISSING_RDATA_FIELDS_KEY
	LDNS_STATUS_MISSING_RDATA_FIELDS_RRSIG
	LDNS_STATUS_NETWORK_ERR
	LDNS_STATUS_NOT_IMPL
	LDNS_STATUS_NO_DATA
	LDNS_STATUS_NSEC3_ERR
	LDNS_STATUS_NULL
	LDNS_STATUS_OK
	LDNS_STATUS_PACKET_OVERFLOW
	LDNS_STATUS_RES_NO_NS
	LDNS_STATUS_RES_QUERY
	LDNS_STATUS_SOCKET_ERROR
	LDNS_STATUS_SSL_ERR
	LDNS_STATUS_SYNTAX_ALG_ERR
	LDNS_STATUS_SYNTAX_BAD_ESCAPE
	LDNS_STATUS_SYNTAX_CLASS_ERR
	LDNS_STATUS_SYNTAX_DNAME_ERR
	LDNS_STATUS_SYNTAX_EMPTY
	LDNS_STATUS_SYNTAX_ERR
	LDNS_STATUS_SYNTAX_INCLUDE
	LDNS_STATUS_SYNTAX_INCLUDE_ERR_NOTIMPL
	LDNS_STATUS_SYNTAX_INTEGER_OVERFLOW
	LDNS_STATUS_SYNTAX_ITERATIONS_OVERFLOW
	LDNS_STATUS_SYNTAX_KEYWORD_ERR
	LDNS_STATUS_SYNTAX_MISSING_VALUE_ERR
	LDNS_STATUS_SYNTAX_ORIGIN
	LDNS_STATUS_SYNTAX_RDATA_ERR
	LDNS_STATUS_SYNTAX_TTL
	LDNS_STATUS_SYNTAX_TTL_ERR
	LDNS_STATUS_SYNTAX_TYPE_ERR
	LDNS_STATUS_SYNTAX_VERSION_ERR
	LDNS_STATUS_UNKNOWN_INET
	LDNS_STATUS_WIRE_INCOMPLETE_ADDITIONAL
	LDNS_STATUS_WIRE_INCOMPLETE_ANSWER
	LDNS_STATUS_WIRE_INCOMPLETE_AUTHORITY
	LDNS_STATUS_WIRE_INCOMPLETE_HEADER
	LDNS_STATUS_WIRE_INCOMPLETE_QUESTION
	LDNS_TC

	dnssec_create_nsec
	dnssec_create_nsec3
	create_nsec
	create_nsec3

	rr_type2str
	rr_class2str
	pkt_opcode2str
	pkt_rcode2str
        rr_type_by_name
        rr_class_by_name
	errorstr_by_id
	signing_algorithm_by_name
	key_algorithm_supported
	read_anchor_file
);

our $VERSION = '0.02';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Net::LDNS::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Net::LDNS', $VERSION);

# Preloaded methods go here.

our $last_status;
our $line_nr;

sub last_error {
    return errorstr_by_id($Net::LDNS::last_status);
}

require Net::LDNS::RR;
require Net::LDNS::GC;
require Net::LDNS::RData;
require Net::LDNS::Zone;
require Net::LDNS::RRList;
require Net::LDNS::DNSSecZone;
require Net::LDNS::DNSSecRRSets;
require Net::LDNS::DNSSecRRs;
require Net::LDNS::DNSSecName;
require Net::LDNS::RBTree;
require Net::LDNS::RBNode;
require Net::LDNS::Resolver;
require Net::LDNS::Packet;
require Net::LDNS::Key;
require Net::LDNS::KeyList;
require Net::LDNS::DNSSecDataChain;
require Net::LDNS::DNSSecTrustTree;

# Some default values used by the constructors
our $DEFAULT_CLASS = &LDNS_RR_CLASS_IN;
our $DEFAULT_TTL = 86400;         # 1d
our $DEFAULT_ORIGIN = new Net::LDNS::RData(&LDNS_RDF_TYPE_DNAME, '.');
our $DEFAULT_SOA_REFRESH = 86400; # 1d
our $DEFAULT_SOA_RETRY = 3600;    # 1h
our $DEFAULT_SOA_EXPIRE = 604800; # 1w
our $DEFAULT_SOA_MINIMUM = 10800; # 3h

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Net::LDNS - Perl extension for the ldns library

=head1 SYNOPSIS

  use Net::LDNS ':all'

  str = rr_type2str(type)
  str = rr_class2str(class)
  type = rr_type_by_name(str)
  class = rr_class_by_name(str)
  str = pkt_opcode2str(opcode)
  str = pkt_rcode2str(rcode)
  error = errorstr_by_id(status)
  str = Net::LDNS::last_error
  status = Net::LDNS::last_status
  rr = dnssec_create_nsec(from, to, type)
  rr = dnssec_create_nsec3(from, to, algorithm, flags, iterations, salt)
  rr = create_nsec(current, next, rrs)
  rr = create_nsec3(cur_owner, cur_zone, algorithm, flags, iterations, salt, 
                    empty_nonterminals)
  algo = signing_algorithm_by_name(name)
  bool = key_algorithm_supported(algorithm)
  rr = read_anchor_file(filename)

=head1 DESCRIPTION

Net::LDNS is a perl OO-wrapper for the ldns library. For a detailed description on how this library works, you are advised to read the ldns documentation. Here follows a very brief description of the classes included in this package and how they map to the ldns library structures:

=over 20

=item B<Net::LDNS>

Base class with static functions and constants

=item B<Net::LDNS::Zone>

Represents a parsed zonefile (maps to the ldns_zone struct)

=item B<Net::LDNS::RRList>

Represents a list of RRs. This class is also used to represent an RRSet all the dnames and types are equal, (maps to the the ldns_rr_list struct)

=item B<Net::LDNS::RR>

Represents a resource record (RR), (maps to the ldns_rr struct)

=item B<Net::LDNS::RData>

Represents an rdata field or a dname in an RR (maps to the ldns_rdf struct)

=item B<Net::LDNS::Resolver>

Represents a DNS resolver (maps to the ldns_resolver struct)

=item B<Net::LDNS::Packet>

Represents a DNS package (maps to the ldns_pkt struct)

=item B<Net::LDNS::Key>

Represents a DNSSec private key (maps to the ldns_key struct)

=item B<Net::LDNS::KeyList>

Represents a linked list of keys (maps to the ldns_key_list struct)

=item B<Net::LDNS::DNSSecZone>

Represents a zone with dnssec data (maps to the ldns_dnssec_zone struct)

=item B<Net::LDNS::RBTree>

Represents a tree of DNSSecName nodes (maps to the ldns_rbtree struct)

=item B<Net::LDNS::RBNode>

Represents a node in the RBTree (maps to the ldns_rbnode struct)

=item B<Net::LDNS::DNSSecName>

Represents a dname in a DNSSecZone and holds a DNSSecRRSets list for this dname, possibly with signatures (maps to the ldns_dnssec_name struct)

=item B<Net::LDNS::DNSSecRRSets>

Represents a linked list of DNSSec RR sets, possibly with signatures (maps to the ldns_dnssec_rrsets struct)

=item B<Net::LDNS::DNSSecRRs>

Represents a linked list of RRs (maps to the ldns_dnssec_rrs struct)

=item B<Net::LDNS::DNSSecDataChain>

Represents a chain of RR, DNSKEY, and DS data used for building a dnssec trust tree (maps to the ldns_dnssec_data_chain struct)

=item B<Net::LDNS::DNSSecTrustTree>

Represents a tree of chained trust relationships from a signed RR to a set of trust anchors (maps to the ldns_dnssec_trust_tree struct).

=item B<Net::LDNS::GC>

Garbage collector. Handles ownership dependencies and freeing data used by the other classes. Used internally only.

=back

For a lists of object methods see the documentation of each of the individual classes. One thing to note is that some of the classes have a seemingly overlapping functionality. The Zone and RRList are used to represent a generic zone. It may contain dnssec data but treats it like any other dns data and does not have any knowledge of its structure. The DNSSec* and RB* classes are building blocks for representing a signed zone in a more structured way.

=head2 Object references and cloning

Since some of the objects are found as sub objects within other objects, it is important to know how the wrapper classes handle object references, dependencies and cloning. The general rule is that accessor methods just return a reference to the object while methods inserting data inserts inserts a clone of the object. Most classes have a clone method which can be used if a cloned object is what you really want.

=head3 Examples

Net::LDNS::Zone::rrs returns a reference to the Net::LDNS::RRList within the zone, so if you make changes to the RRList you also changes the Zone object. 

Net::LDNS::RRList::push(rr) clones the rr, then pushes the cloned rr to the list. Changing the rr afterwards will not change the list.

An exception is the Key class which does not have a clone mechanism. In this case we allow a free Key to be added to only one KeyList. Adding it to multiple lists will provoke an error.

The wrapper keeps track of allocated data structures and references. Whenever data is no longer referred to by a perl object, it will be freed.

=head2 ERROR HANDLING

The purpose for writing this wrapper class has been to be able to process zone file data with good time performance. Data checking and error handling is a bit sparse. Calling a method with wrong argument types will some times kill the application with an intelligible error message, in other cases it may provoke a segmentation fault. Using out-of-range data values, e.g. in array indexes, may also cause unexpected results.

Most constructors and all methods returning a status will update the static Net::LDNS::last_status variable. Most methods do not return a status and will not reset this variable even though they succeeds.

=head2 EXPORT

None by default.

=head2 Exportable constants

=head3 Status

  LDNS_STATUS_ADDRESS_ERR
  LDNS_STATUS_CERT_BAD_ALGORITHM
  LDNS_STATUS_CRYPTO_ALGO_NOT_IMPL
  LDNS_STATUS_CRYPTO_BOGUS
  LDNS_STATUS_CRYPTO_EXPIRATION_BEFORE_INCEPTION
  LDNS_STATUS_CRYPTO_NO_DNSKEY
  LDNS_STATUS_CRYPTO_NO_DS
  LDNS_STATUS_CRYPTO_NO_MATCHING_KEYTAG_DNSKEY
  LDNS_STATUS_CRYPTO_NO_RRSIG
  LDNS_STATUS_CRYPTO_NO_TRUSTED_DNSKEY
  LDNS_STATUS_CRYPTO_NO_TRUSTED_DS
  LDNS_STATUS_CRYPTO_SIG_EXPIRED
  LDNS_STATUS_CRYPTO_SIG_NOT_INCEPTED
  LDNS_STATUS_CRYPTO_TSIG_BOGUS
  LDNS_STATUS_CRYPTO_TSIG_ERR
  LDNS_STATUS_CRYPTO_TYPE_COVERED_ERR
  LDNS_STATUS_CRYPTO_UNKNOWN_ALGO
  LDNS_STATUS_CRYPTO_VALIDATED
  LDNS_STATUS_DDD_OVERFLOW
  LDNS_STATUS_DNSSEC_EXISTENCE_DENIED
  LDNS_STATUS_DNSSEC_NSEC3_ORIGINAL_NOT_FOUND
  LDNS_STATUS_DNSSEC_NSEC_RR_NOT_COVERED
  LDNS_STATUS_DNSSEC_NSEC_WILDCARD_NOT_COVERED
  LDNS_STATUS_DOMAINNAME_OVERFLOW
  LDNS_STATUS_DOMAINNAME_UNDERFLOW
  LDNS_STATUS_EMPTY_LABEL
  LDNS_STATUS_ENGINE_KEY_NOT_LOADED
  LDNS_STATUS_ERR
  LDNS_STATUS_FILE_ERR
  LDNS_STATUS_INTERNAL_ERR
  LDNS_STATUS_INVALID_B32_EXT
  LDNS_STATUS_INVALID_B64
  LDNS_STATUS_INVALID_HEX
  LDNS_STATUS_INVALID_INT
  LDNS_STATUS_INVALID_IP4
  LDNS_STATUS_INVALID_IP6
  LDNS_STATUS_INVALID_POINTER
  LDNS_STATUS_INVALID_STR
  LDNS_STATUS_INVALID_TIME
  LDNS_STATUS_LABEL_OVERFLOW
  LDNS_STATUS_MEM_ERR
  LDNS_STATUS_MISSING_RDATA_FIELDS_KEY
  LDNS_STATUS_MISSING_RDATA_FIELDS_RRSIG
  LDNS_STATUS_NETWORK_ERR
  LDNS_STATUS_NOT_IMPL
  LDNS_STATUS_NO_DATA
  LDNS_STATUS_NSEC3_ERR
  LDNS_STATUS_NULL
  LDNS_STATUS_OK
  LDNS_STATUS_PACKET_OVERFLOW
  LDNS_STATUS_RES_NO_NS
  LDNS_STATUS_RES_QUERY
  LDNS_STATUS_SOCKET_ERROR
  LDNS_STATUS_SSL_ERR
  LDNS_STATUS_SYNTAX_ALG_ERR
  LDNS_STATUS_SYNTAX_BAD_ESCAPE
  LDNS_STATUS_SYNTAX_CLASS_ERR
  LDNS_STATUS_SYNTAX_DNAME_ERR
  LDNS_STATUS_SYNTAX_EMPTY
  LDNS_STATUS_SYNTAX_ERR
  LDNS_STATUS_SYNTAX_INCLUDE
  LDNS_STATUS_SYNTAX_INCLUDE_ERR_NOTIMPL
  LDNS_STATUS_SYNTAX_INTEGER_OVERFLOW
  LDNS_STATUS_SYNTAX_ITERATIONS_OVERFLOW
  LDNS_STATUS_SYNTAX_KEYWORD_ERR
  LDNS_STATUS_SYNTAX_MISSING_VALUE_ERR
  LDNS_STATUS_SYNTAX_ORIGIN
  LDNS_STATUS_SYNTAX_RDATA_ERR
  LDNS_STATUS_SYNTAX_TTL
  LDNS_STATUS_SYNTAX_TTL_ERR
  LDNS_STATUS_SYNTAX_TYPE_ERR
  LDNS_STATUS_SYNTAX_VERSION_ERR
  LDNS_STATUS_UNKNOWN_INET
  LDNS_STATUS_WIRE_INCOMPLETE_ADDITIONAL
  LDNS_STATUS_WIRE_INCOMPLETE_ANSWER
  LDNS_STATUS_WIRE_INCOMPLETE_AUTHORITY
  LDNS_STATUS_WIRE_INCOMPLETE_HEADER
  LDNS_STATUS_WIRE_INCOMPLETE_QUESTION

=head3 Resolver flags and constants

  LDNS_RESOLV_ANCHOR
  LDNS_RESOLV_DEFDOMAIN
  LDNS_RESOLV_INET
  LDNS_RESOLV_INET6
  LDNS_RESOLV_INETANY
  LDNS_RESOLV_KEYWORD
  LDNS_RESOLV_KEYWORDS
  LDNS_RESOLV_NAMESERVER
  LDNS_RESOLV_OPTIONS
  LDNS_RESOLV_RTT_INF
  LDNS_RESOLV_RTT_MIN
  LDNS_RESOLV_SEARCH
  LDNS_RESOLV_SORTLIST

=head3 Resolver query flags

  LDNS_AA
  LDNS_AD
  LDNS_CD
  LDNS_QR
  LDNS_RA
  LDNS_RD
  LDNS_TC

=head3 Resolver rcodes

  LDNS_RCODE_FORMERR
  LDNS_RCODE_NOERROR
  LDNS_RCODE_NOTAUTH
  LDNS_RCODE_NOTIMPL
  LDNS_RCODE_NOTZONE
  LDNS_RCODE_NXDOMAIN
  LDNS_RCODE_NXRRSET
  LDNS_RCODE_REFUSED
  LDNS_RCODE_SERVFAIL
  LDNS_RCODE_YXDOMAIN
  LDNS_RCODE_YXRRSET

=head3 Packet types

  LDNS_PACKET_ANSWER
  LDNS_PACKET_NODATA
  LDNS_PACKET_NXDOMAIN
  LDNS_PACKET_QUESTION
  LDNS_PACKET_REFERRAL
  LDNS_PACKET_UNKNOWN

=head3 Packet opcodes

  LDNS_PACKET_IQUERY
  LDNS_PACKET_NOTIFY
  LDNS_PACKET_QUERY
  LDNS_PACKET_STATUS
  LDNS_PACKET_UPDATE

=head3 Packet sections

  LDNS_SECTION_ADDITIONAL
  LDNS_SECTION_ANSWER
  LDNS_SECTION_ANY
  LDNS_SECTION_ANY_NOQUESTION
  LDNS_SECTION_AUTHORITY
  LDNS_SECTION_QUESTION

=head3 DNSSec constants

  LDNS_DEFAULT_EXP_TIME
  LDNS_MAX_KEYLEN
  LDNS_DNSSEC_KEYPROTO

=head3 DNSSec sign policies

  LDNS_SIGNATURE_LEAVE_ADD_NEW
  LDNS_SIGNATURE_LEAVE_NO_ADD
  LDNS_SIGNATURE_REMOVE_ADD_NEW
  LDNS_SIGNATURE_REMOVE_NO_ADD
  LDNS_NSEC3_MAX_ITERATIONS

=head3 Key flags

  LDNS_KEY_REVOKE_KEY
  LDNS_KEY_SEP_KEY
  LDNS_KEY_ZONE_KEY

=head3 Key algorithms

  LDNS_DH
  LDNS_DSA
  LDNS_DSA_NSEC3
  LDNS_ECC
  LDNS_RSAMD5
  LDNS_RSASHA1
  LDNS_RSASHA1_NSEC3
  LDNS_RSASHA256
  LDNS_RSASHA512
  LDNS_ECC_GOST
  LDNS_PRIVATEDNS
  LDNS_PRIVATEOID

=head3 Signing algorithms

  LDNS_SIGN_DSA
  LDNS_SIGN_DSA_NSEC3
  LDNS_SIGN_ECC_GOST
  LDNS_SIGN_HMACSHA1
  LDNS_SIGN_HMACSHA256
  LDNS_SIGN_RSAMD5
  LDNS_SIGN_RSASHA1
  LDNS_SIGN_RSASHA1_NSEC3
  LDNS_SIGN_RSASHA256
  LDNS_SIGN_RSASHA512

=head3 Hashing algorithm

  LDNS_SHA1
  LDNS_SHA256
  LDNS_HASH_GOST

=head3 Rdata constants

  LDNS_MAX_RDFLEN
  LDNS_NSEC3_VARS_OPTOUT_MASK

  LDNS_RDF_SIZE_16BYTES
  LDNS_RDF_SIZE_6BYTES
  LDNS_RDF_SIZE_BYTE
  LDNS_RDF_SIZE_DOUBLEWORD
  LDNS_RDF_SIZE_WORD

=head3 Rdata types

  LDNS_RDF_TYPE_A
  LDNS_RDF_TYPE_AAAA
  LDNS_RDF_TYPE_ALG
  LDNS_RDF_TYPE_APL
  LDNS_RDF_TYPE_ATMA
  LDNS_RDF_TYPE_B32_EXT
  LDNS_RDF_TYPE_B64
  LDNS_RDF_TYPE_CERT_ALG
  LDNS_RDF_TYPE_CLASS
  LDNS_RDF_TYPE_DNAME
  LDNS_RDF_TYPE_HEX
  LDNS_RDF_TYPE_INT16
  LDNS_RDF_TYPE_INT16_DATA
  LDNS_RDF_TYPE_INT32
  LDNS_RDF_TYPE_INT8
  LDNS_RDF_TYPE_IPSECKEY
  LDNS_RDF_TYPE_LOC
  LDNS_RDF_TYPE_NONE
  LDNS_RDF_TYPE_NSAP
  LDNS_RDF_TYPE_NSEC
  LDNS_RDF_TYPE_NSEC3_NEXT_OWNER
  LDNS_RDF_TYPE_NSEC3_SALT
  LDNS_RDF_TYPE_PERIOD
  LDNS_RDF_TYPE_SERVICE
  LDNS_RDF_TYPE_STR
  LDNS_RDF_TYPE_TIME
  LDNS_RDF_TYPE_HIP
  LDNS_RDF_TYPE_TSIGTIME
  LDNS_RDF_TYPE_TYPE
  LDNS_RDF_TYPE_UNKNOWN
  LDNS_RDF_TYPE_WKS

=head3 Algorithms used in CERT RRs.

  LDNS_CERT_ACPKIX
  LDNS_CERT_IACPKIX
  LDNS_CERT_IPGP
  LDNS_CERT_IPKIX
  LDNS_CERT_ISPKI
  LDNS_CERT_OID
  LDNS_CERT_PGP
  LDNS_CERT_PKIX
  LDNS_CERT_SPKI
  LDNS_CERT_URI

=head3 RR compress flag

  LDNS_RR_COMPRESS
  LDNS_RR_NO_COMPRESS

=head3 RR classes

  LDNS_RR_CLASS_ANY
  LDNS_RR_CLASS_CH
  LDNS_RR_CLASS_COUNT
  LDNS_RR_CLASS_FIRST
  LDNS_RR_CLASS_HS
  LDNS_RR_CLASS_IN
  LDNS_RR_CLASS_LAST
  LDNS_RR_CLASS_NONE

=head3 RR types

  LDNS_RR_TYPE_A
  LDNS_RR_TYPE_A6
  LDNS_RR_TYPE_AAAA
  LDNS_RR_TYPE_AFSDB
  LDNS_RR_TYPE_ANY
  LDNS_RR_TYPE_APL
  LDNS_RR_TYPE_ATMA
  LDNS_RR_TYPE_AXFR
  LDNS_RR_TYPE_CERT
  LDNS_RR_TYPE_CNAME
  LDNS_RR_TYPE_COUNT
  LDNS_RR_TYPE_DHCID
  LDNS_RR_TYPE_DLV
  LDNS_RR_TYPE_DNAME
  LDNS_RR_TYPE_DNSKEY
  LDNS_RR_TYPE_DS
  LDNS_RR_TYPE_EID
  LDNS_RR_TYPE_FIRST
  LDNS_RR_TYPE_GID
  LDNS_RR_TYPE_GPOS
  LDNS_RR_TYPE_HINFO
  LDNS_RR_TYPE_IPSECKEY
  LDNS_RR_TYPE_ISDN
  LDNS_RR_TYPE_IXFR
  LDNS_RR_TYPE_KEY
  LDNS_RR_TYPE_KX
  LDNS_RR_TYPE_LAST
  LDNS_RR_TYPE_LOC
  LDNS_RR_TYPE_MAILA
  LDNS_RR_TYPE_MAILB
  LDNS_RR_TYPE_MB
  LDNS_RR_TYPE_MD
  LDNS_RR_TYPE_MF
  LDNS_RR_TYPE_MG
  LDNS_RR_TYPE_MINFO
  LDNS_RR_TYPE_MR
  LDNS_RR_TYPE_MX
  LDNS_RR_TYPE_NAPTR
  LDNS_RR_TYPE_NIMLOC
  LDNS_RR_TYPE_NS
  LDNS_RR_TYPE_NSAP
  LDNS_RR_TYPE_NSAP_PTR
  LDNS_RR_TYPE_NSEC
  LDNS_RR_TYPE_NSEC3
  LDNS_RR_TYPE_NSEC3PARAM
  LDNS_RR_TYPE_NSEC3PARAMS
  LDNS_RR_TYPE_NULL
  LDNS_RR_TYPE_NXT
  LDNS_RR_TYPE_OPT
  LDNS_RR_TYPE_PTR
  LDNS_RR_TYPE_PX
  LDNS_RR_TYPE_RP
  LDNS_RR_TYPE_RRSIG
  LDNS_RR_TYPE_RT
  LDNS_RR_TYPE_SIG
  LDNS_RR_TYPE_SINK
  LDNS_RR_TYPE_SOA
  LDNS_RR_TYPE_SPF
  LDNS_RR_TYPE_SRV
  LDNS_RR_TYPE_SSHFP
  LDNS_RR_TYPE_TALINK
  LDNS_RR_TYPE_TSIG
  LDNS_RR_TYPE_TXT
  LDNS_RR_TYPE_UID
  LDNS_RR_TYPE_UINFO
  LDNS_RR_TYPE_UNSPEC
  LDNS_RR_TYPE_WKS
  LDNS_RR_TYPE_X25

=head3 Various defaults and other constants
  LDNS_DEFAULT_TTL
  LDNS_PORT
  LDNS_IP4ADDRLEN
  LDNS_IP6ADDRLEN
  LDNS_MAX_DOMAINLEN
  LDNS_MAX_LABELLEN
  LDNS_MAX_PACKETLEN
  LDNS_MAX_POINTERS
  LDNS_RR_OVERHEAD
  LDNS_RDATA_FIELD_DESCRIPTORS_COMMON

=head1 BUGS

This package is currently in a very early stage of development. There
are probably some bugs. You may also expect that method names and behaviour
could change without much considerations to backward compatibility.

=head1 SEE ALSO

http://www.nlnetlabs.nl/projects/ldns

=head1 AUTHOR

Erik Pihl Ostlyngen, E<lt>erik.ostlyngen@uninett.noE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Erik Pihl Ostlyngen

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
