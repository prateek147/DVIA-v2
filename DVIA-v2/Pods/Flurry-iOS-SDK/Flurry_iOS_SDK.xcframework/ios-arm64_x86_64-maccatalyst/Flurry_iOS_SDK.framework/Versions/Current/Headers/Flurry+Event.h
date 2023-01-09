//
//  Flurry+Event.h
//  Flurry
//
//  Copyright (c) 2021 Yahoo. All rights reserved.
//
//  Methods in this header file are for use with Flurry Analytics

#import <Foundation/Foundation.h>
#import "Flurry.h"

typedef NS_ENUM (NSUInteger, FlurryStandardEventNameType) {
    FlurryStringParamType = 0,
    FlurryIntegerParamType,
    FlurryDoubleParamType,
    FlurryBooleanParamType,
    FlurryLongParamType
};

typedef NS_ENUM (NSUInteger, FlurryEvent) {
    /*!
     * @brief Log this event when a user clicks on an Ad.
     * suggested event params: adType
     * mandatory event params : none
     */
    FLURRY_EVENT_AD_CLICK NS_SWIFT_NAME(adClick) = 0,
    /*!
     * @brief Log this event when a user views an Ad impression.
     * suggested event params : adType
     * mandatory event params : none
     */
    FLURRY_EVENT_AD_IMPRESSION NS_SWIFT_NAME(adImpression),
    /*!
     * @brief Log this event when a user is granted a reward for viewing a rewarded Ad.
     * suggested event params : adType
     * mandatory event params : none
     */
    FLURRY_EVENT_AD_REWARDED NS_SWIFT_NAME(adRewarded),
    /*!
     * @brief Log this event when a user skips an Ad
     * suggested event params : adType
     * mandatory event params : none
     */
    FLURRY_EVENT_AD_SKIPPED NS_SWIFT_NAME(adSkipped),
    /*!
     * @brief Log this event when a user spends credit in the app
     * suggested event params : levelNumber, totalAmount, isCurrencySoft, creditType, creditId, creditName, currencyType
     * mandatory event params : totalAmount
     */
    FLURRY_EVENT_CREDITS_SPENT NS_SWIFT_NAME(creditsSpent),
    /*!
     * @brief Log this event when a user purchases credit in the app
     * suggested event params : levelNumber, totalAmount, isCurrencySoft, creditType, creditId, creditName, currencyType
     * mandatory event params : totalAmount
     */
    FLURRY_EVENT_CREDITS_PURCHASED NS_SWIFT_NAME(creditsPurchased),
    /*!
     * @brief Log this event when a user earns credit in the app
     * suggested event params : levelNumber, totalAmount, isCurrencySoft, creditType, creditId, creditName, currencyType
     * mandatory event params : totalAmount
     */
    FLURRY_EVENT_CREDITS_EARNED NS_SWIFT_NAME(creditsEarned),
    /*!
     * @brief Log this event when a user unlocks an achievement in the app
     * suggested event params : achievementId
     * mandatory event params : none
     */
    FLURRY_EVENT_ACHIEVEMENT_UNLOCKED NS_SWIFT_NAME(achievementUnlocked),
    /*!
     * @brief Log this event when an App user completes a level
     * suggested event params : levelNumber, levelName
     * mandatory event params : levelNumber
     */
    FLURRY_EVENT_LEVEL_COMPLETED NS_SWIFT_NAME(levelCompleted),
    /*!
     * @brief Log this event when an App user fails a level
     * suggested event params : levelNumber, levelName
     * mandatory event params : levelNumber
     */
    FLURRY_EVENT_LEVEL_FAILED NS_SWIFT_NAME(levelFailed),
    /*!
     * @brief Log this event when an App user levels up
     * suggested event params : levelNumber, levelName
     * mandatory event params : levelNumber
     */
    FLURRY_EVENT_LEVEL_UP NS_SWIFT_NAME(levelUp),
    /*!
     * @brief Log this event when an App user starts a level
     * suggested event params : levelNumber, levelName
     * mandatory event params : levelNumber
     */
    FLURRY_EVENT_LEVEL_STARTED NS_SWIFT_NAME(levelStarted),
    /*!
     * @brief Log this event when an App user skips a level
     * suggested event params : levelNumber, levelName
     * mandatory event params : levelNumber
     */
    FLURRY_EVENT_LEVEL_SKIP NS_SWIFT_NAME(levelSkip),
    /*!
     * @brief Log this event when an App user posts his score
     * suggested event params : score, levelNumber
     * mandatory event params : score
     */
    FLURRY_EVENT_SCORE_POSTED NS_SWIFT_NAME(scorePosted),
    /*!
     * @brief Log this event when a user rates a content in the App
     * suggested event params : contentId, contentType, contentName, rating
     * mandatory event params : contentId, rating
     */
    FLURRY_EVENT_CONTENT_RATED NS_SWIFT_NAME(contentRated),
    /*!
     * @brief Log this event when a specific content is viewed by a user
     * suggested event params : contentId, contentType, contentName
     * mandatory event params : contentId
     */
    FLURRY_EVENT_CONTENT_VIEWED NS_SWIFT_NAME(contentViewed),
    /*!
     * @brief Log this event when a user saves the content in the App
     * suggested event params : contentId, contentType, contentName
     * mandatory event params : contentId
     */
    FLURRY_EVENT_CONTENT_SAVED NS_SWIFT_NAME(contentSaved),
    /*!
     * @brief Log this event when a user customizes the App/product
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_PRODUCT_CUSTOMIZED NS_SWIFT_NAME(productCustomized),
    /*!
     * @brief Log this event when the App is activated
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_APP_ACTIVATED NS_SWIFT_NAME(appActivated),
    /*!
     * @brief Log this event when a user submits an application through the App
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_APPLICATION_SUBMITTED NS_SWIFT_NAME(applicationSubmitted),
    /*!
     * @brief Log this event when an item is added to the cart
     * suggested event params : itemCount, price, itemId, itemName, itemType
     * mandatory event params : itemCount, price
     */
    FLURRY_EVENT_ADD_ITEM_TO_CART NS_SWIFT_NAME(addItemToCart),
    /*!
     * @brief Log this event when an item is added to the wish list
     * suggested event params : itemCount, price, itemId, itemName, itemType
     * mandatory event params : itemCount, price
     */
    FLURRY_EVENT_ADD_ITEM_TO_WISH_LIST NS_SWIFT_NAME(addItemToWishList),
    /*!
     * @brief Log this event when checkout is completed or transaction is successfully completed
     * suggested event params : itemCount, totalAmount, currencyType, transactionId
     * mandatory event params : itemCount, totalAmount
     */
    FLURRY_EVENT_COMPLETED_CHECKOUT NS_SWIFT_NAME(completedCheckout),
    /*!
     * @brief Log this event when payment information is added during a checkout process
     * suggested event params : success, paymentType
     * mandatory event params : none
     */
    FLURRY_EVENT_PAYMENT_INFO_ADDED NS_SWIFT_NAME(paymentInfoAdded),
    /*!
     * @brief Log this event when an item is viewed
     * suggested event params : itemId, itemName, itemType, price
     * mandatory event params : itemId
     */
    FLURRY_EVENT_ITEM_VIEWED NS_SWIFT_NAME(itemViewed),
    /*!
     * @brief Log this event when a list of items is viewed
     * suggested event params : itemListType
     * mandatory event params : none
     */
    FLURRY_EVENT_ITEM_LIST_VIEWED NS_SWIFT_NAME(itemListViewed),
    /*!
     * @brief Log this event when a user does a purchase in the App
     * suggested event params : itemCount, totalAmount, itemId, success, itemName, itemType, currencyType, transactionId
     * mandatory event params : totalAmount
     */
    FLURRY_EVENT_PURCHASED NS_SWIFT_NAME(purchased),
    /*!
     * @brief Log this event when a purchase is refunded
     * suggested event params : price, currencyType
     * mandatory event params : price
     */
    FLURRY_EVENT_PURCHASE_REFUNDED NS_SWIFT_NAME(purchaseRefunded),
    /*!
     * @brief Log this event when a user removes an item from the cart
     * suggested event params : itemId, price, itemName, itemType
     * mandatory event params : itemId
     */
    FLURRY_EVENT_REMOVE_ITEM_FROM_CART NS_SWIFT_NAME(removeItemFromCart),
    /*!
     * @brief Log this event when a user starts checkout
     * suggested event params : itemCount, totalAmount
     * mandatory event params : itemCount, totalAmount
     */
    FLURRY_EVENT_CHECKOUT_INITIATED NS_SWIFT_NAME(checkoutInitiated),
    /*!
     * @brief Log this event when a user donates fund to your App or through the App
     * suggested event params : price, currencyType
     * mandatory event params : price
     */
    FLURRY_EVENT_FUNDS_DONATED NS_SWIFT_NAME(fundsDonated),
    /*!
     * @brief Log this event when user schedules an appointment using the App
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_USER_SCHEDULED NS_SWIFT_NAME(userScheduled),
    /*!
     * @brief Log this event when an offer is presented to the user
     * suggested event params : itemId, itemName, itemCategory, price
     * mandatory event params : itemId, price
     */
    FLURRY_EVENT_OFFER_PRESENTED NS_SWIFT_NAME(offerPresented),
    /*!
     * @brief Log this event at the start of a paid subscription for a service or product
     * suggested event params : price, isAnnualSubscription, trialDays, predictedLTV, currencyType, subscriptionCountry
     * mandatory event params : price, isAnnualSubscription
     */
    FLURRY_EVENT_SUBSCRIPTION_STARTED NS_SWIFT_NAME(subscriptionStarted),
    /*!
     * @brief Log this event when a user unsubscribes from a paid subscription
     * for a service or product
     * suggested event params : isAnnualSubscription, currencyType, subscriptionCountry
     * mandatory event params : isAnnualSubscription
     */
    FLURRY_EVENT_SUBSCRIPTION_ENDED NS_SWIFT_NAME(subscriptionEnded),
    /*!
     * @brief Log this event when user joins a group.
     * suggested event params : groupName
     * mandatory event params : none
     */
    FLURRY_EVENT_GROUP_JOINED NS_SWIFT_NAME(groupJoined),
    /*!
     * @brief Log this event when user leaves a group
     * suggested event params : groupName
     * mandatory event params : none
     */
    FLURRY_EVENT_GROUP_LEFT NS_SWIFT_NAME(groupLeft),
    /*!
     * @brief Log this event when a user starts a tutorial
     * suggested event params : tutorialName
     * mandatory event params : none
     */
    FLURRY_EVENT_TUTORIAL_STARTED NS_SWIFT_NAME(tutorialStarted),
    /*!
     * @brief Log this event when a user completes a tutorial
     * suggested event params : tutorialName
     * mandatory event params : none
     */
    FLURRY_EVENT_TUTORIAL_COMPLETED NS_SWIFT_NAME(tutorialCompleted),
    /*!
     * @brief Log this event when a specific tutorial step is completed
     * suggested event params : stepNumber, tutorialName
     * mandatory event params : stepNumber
     */
    FLURRY_EVENT_TUTORIAL_STEP_COMPLETED NS_SWIFT_NAME(tutorialStepCompleted),
    /*!
     * @brief Log this event when user skips the tutorial
     * suggested event params : stepNumber, tutorialName
     * mandatory event params : stepNumber
     */
    FLURRY_EVENT_TUTORIAL_SKIPPED NS_SWIFT_NAME(tutorialSkipped),
    /*!
     * @brief Log this event when a user login on the App
     * suggested event params : userId, method
     * mandatory event params : none
     */
    FLURRY_EVENT_LOGIN NS_SWIFT_NAME(login),
    /*!
     * @brief Log this event when a user logout of the App
     * suggested event params : userId, method
     * mandatory event params : none
     */
    FLURRY_EVENT_LOGOUT NS_SWIFT_NAME(logout),
    /*!
     * @brief Log the event when a user registers (signup). Helps capture the method
     * used to sign-up (sign up with google / apple or email address)
     * suggested event params : userId, method
     * mandatory event params : none
     */
    FLURRY_EVENT_USER_REGISTERED NS_SWIFT_NAME(userRegistered),
    /*!
     * @brief Log this event when user views search results
     * suggested event params : query, searchType (e.g. voice, text)
     * mandatory event params : none
     */
    FLURRY_EVENT_SEARCH_RESULT_VIEWED NS_SWIFT_NAME(searchResultViewed),
    /*!
     * @brief Log this event when a user searches for a keyword using Search
     * suggested event params : query, searchType (e.g. voice, text)
     * mandatory event params : none
     */
    FLURRY_EVENT_KEYWORD_SEARCHED NS_SWIFT_NAME(keywordSearched),
    /*!
     * @brief Log this event when a user searches for a location using Search
     * suggested event params : query
     * mandatory event params : none
     */
    FLURRY_EVENT_LOCATION_SEARCHED NS_SWIFT_NAME(locationSearched),
    /*!
     * @brief Log this event when a user invites another user
     * suggested event params : userId, method
     * mandatory event params : none
     */
    FLURRY_EVENT_INVITE NS_SWIFT_NAME(invite),
    /*!
     * @brief Log this event when a user shares content with another user in the App
     * suggested event params : socialContentId, socialContentName, method
     * mandatory event params : socialContentId
     */
    FLURRY_EVENT_SHARE NS_SWIFT_NAME(share),
    /*!
     * @brief Log this event when a user likes a social content. e.g. likeType captures what kind of like is logged ("celebrate", "insightful", etc)
     * suggested event params : socialContentId, socialContentName, likeType
     * mandatory event params : socialContentId
     */
    FLURRY_EVENT_LIKE NS_SWIFT_NAME(like),
    /*!
     * @brief Log this event when a user comments or replies on a social post
     * suggested event params : socialContentId, socialContentName
     * mandatory event params : socialContentId
     */
    FLURRY_EVENT_COMMENT NS_SWIFT_NAME(comment),
    /*!
     * @brief Log this event when an image, audio or a video is captured
     * suggested event params : mediaId, mediaName, mediaType
     * mandatory event params : none
     */
    FLURRY_EVENT_MEDIA_CAPTURED NS_SWIFT_NAME(mediaCaptured),
    /*!
     * @brief Log this event when an audio or video starts
     * suggested event params : mediaId, mediaName, mediaType
     * mandatory event params : none
     */
    FLURRY_EVENT_MEDIA_STARTED NS_SWIFT_NAME(mediaStarted),
    /*!
     * @brief Log this event when an audio or video is stopped
     * suggested event params : mediaId, duration (in seconds), mediaName, mediaType
     * mandatory event params : duration (in seconds)
     */
    FLURRY_EVENT_MEDIA_STOPPED NS_SWIFT_NAME(mediaStopped),
    /*!
     * @brief Log this event when an audio or video is paused
     * suggested event params : mediaId, duration (in seconds), mediaName, mediaType
     * mandatory event params : duration (in seconds)
     */
    FLURRY_EVENT_MEDIA_PAUSED NS_SWIFT_NAME(mediaPaused),
    /*!
     * @brief Log this event when a privacy prompt is displayed
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_PRIVACY_PROMPT_DISPLAYED NS_SWIFT_NAME(privacyPromptDisplayed),
    /*!
     * @brief Log this event when a user opts in (on the privacy prompt)
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_PRIVACY_OPT_IN NS_SWIFT_NAME(privacyOptIn),
    /*!
     * @brief Log this event when a user opts out (on the privacy prompt)
     * suggested event params : none
     * mandatory event params : none
     */
    FLURRY_EVENT_PRIVACY_OPT_OUT NS_SWIFT_NAME(privacyOptOut),
    
};

/*!
 * @brief FlurryParam serves as a generic class for five types of Flurry param keys.
 *
 * Each Flurry-defined param key is allowed to map to the value within five data types: string, int,
 * double, boolean, long. Flurry also defines the interface for each type of the key.
 *
 * @since 11.3.0
 */
@interface FlurryParam : NSObject

@end
/*!
 * @brief FlurryStringParam is the interface of Flurry-defined param keys which can be only
 * mapped with string value. It is a subclass of FlurryParam interface.
 *
 * @since 11.3.0
 */
@interface FlurryStringParam : FlurryParam

@end
/*!
 * @brief FlurryIntegerParam is the interface of Flurry-defined param keys which can be only
 * mapped with integer value. It is a subclass of FlurryParam interface.
 *
 * @since 11.3.0
 */
@interface FlurryIntegerParam : FlurryParam

@end
/*!
 * @brief FlurryDoubleParam is the interface of Flurry-defined param keys which can be only
 * mapped with double value. It is a subclass of FlurryParam interface.
 *
 * @since 11.3.0
 */
@interface FlurryDoubleParam : FlurryParam

@end
/*!
 * @brief FlurryLongParam is the interface of Flurry-defined param keys which can be only
 * mapped with long value. It is a subclass of FlurryParam interface.
 *
 * @since 11.3.0
 */
@interface FlurryLongParam : FlurryParam

@end
/*!
 * @brief FlurryBooleanParam is the interface of Flurry-defined param keys which can be only
 * mapped with boolean value. It is a subclass of FlurryParam interface.
 *
 * @since 11.3.0
 */
@interface FlurryBooleanParam : FlurryParam

@end

/*!
 * @brief FlurryParamBuilder is the interface to use to assemble your parameters for standard event.
 * @since 11.3.0
 *
 * In order for Flurry to log a standard event, you might want to put the standardized parameters as well as
 * your own defined parameters together. There will be recommended standardized parameter keys and
 * mandatory standardized parameter keys defined for each standard event name. For instance, to log
 * FLURRY_EVENT_PURCHASED event, SDK suggests to include itemCount, totalAmount, itemId,
 * success, itemName, itemType, currencyType and transactionId parameters, in which totalAmount is also
 * a mandatory parameter that is indicated by the SDK. Since each type of standardized param key can
 * only be mapped to its corresponding data value - string, integer, double, boolean, long, when you assemble
 * your FlurryParamBuilder object with the standardized parameters, you will need to use the public APIs
 * specified in FlurryParamBuilder interface to map them correctly.
 */
@interface FlurryParamBuilder : NSObject
/*!
 * @brief return the flurry-defined key for param - adType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) adType;
/*!
 * @brief return the flurry-defined key for param - levelName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) levelName;
/*!
 * @brief return the flurry-defined key for param - levelNumber
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) levelNumber;
/*!
 * @brief return the flurry-defined key for param - contentName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) contentName;
/*!
 * @brief return the flurry-defined key for param - contentType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) contentType;
/*!
 * @brief return the flurry-defined key for param - contentId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) contentId;
/*!
 * @brief return the flurry-defined key for param - creditName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) creditName;
/*!
 * @brief return the flurry-defined key for param - creditType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) creditType;
/*!
 * @brief return the flurry-defined key for param - creditId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) creditId;
/*!
 * @brief return the flurry-defined key for param - currencyType (ISO code)
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) currencyType;
/*!
 * @brief return the flurry-defined key for param - isCurrencySoft
 * @since 11.3.0
 */
+ (FlurryBooleanParam * _Nonnull) isCurrencySoft;
/*!
 * @brief return the flurry-defined key for param - itemName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) itemName;
/*!
 * @brief return the flurry-defined key for param - itemType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) itemType;
/*!
 * @brief return the flurry-defined key for param - itemId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) itemId;
/*!
 * @brief return the flurry-defined key for param - itemCount
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) itemCount;
/*!
 * @brief return the flurry-defined key for param - itemCategory
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) itemCategory;
/*!
 * @brief return the flurry-defined key for param - itemListType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) itemListType;
/*!
 * @brief return the flurry-defined key for param - price
 * @since 11.3.0
 */
+ (FlurryDoubleParam * _Nonnull) price;
/*!
 * @brief return the flurry-defined key for param - totalAmount
 * @since 11.3.0
 */
+ (FlurryDoubleParam * _Nonnull) totalAmount;
/*!
 * @brief return the flurry-defined key for param - achievementId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) achievementId;
/*!
 * @brief return the flurry-defined key for param - score
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) score;
/*!
 * @brief return the flurry-defined key for param - rating
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) rating;
/*!
 * @brief return the flurry-defined key for param - transactionId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) transactionId;
/*!
 * @brief return the flurry-defined key for param - success
 * @since 11.3.0
 */
+ (FlurryBooleanParam * _Nonnull) success;
/*!
 * @brief return the flurry-defined key for param - paymentType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) paymentType;
/*!
 * @brief return the flurry-defined key for param - isAnnualSubscription
 * @since 11.3.0
 */
+ (FlurryBooleanParam * _Nonnull) isAnnualSubscription;
/*!
 * @brief return the flurry-defined key for param - subscriptionCountry
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) subscriptionCountry;
/*!
 * @brief return the flurry-defined key for param - trialDays
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) trialDays;
/*!
 * @brief return the flurry-defined key for param - predictedLTV
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) predictedLTV;
/*!
 * @brief return the flurry-defined key for param - groupName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) groupName;
/*!
 * @brief return the flurry-defined key for param - stepNumber
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) stepNumber;
/*!
 * @brief return the flurry-defined key for param - tutorialName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) tutorialName;
/*!
 * @brief return the flurry-defined key for param - userId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) userId;
/*!
 * @brief return the flurry-defined key for param - method
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) method;
/*!
 * @brief return the flurry-defined key for param - query
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) query;
/*!
 * @brief return the flurry-defined key for param - searchType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) searchType;
/*!
 * @brief return the flurry-defined key for param - socialContentName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) socialContentName;
/*!
 * @brief return the flurry-defined key for param - socialContentId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) socialContentId;
/*!
 * @brief return the flurry-defined key for param - likeType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) likeType;
/*!
 * @brief return the flurry-defined key for param - mediaName
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) mediaName;
/*!
 * @brief return the flurry-defined key for param - mediaType
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) mediaType;
/*!
 * @brief return the flurry-defined key for param - mediaId
 * @since 11.3.0
 */
+ (FlurryStringParam * _Nonnull) mediaId;
/*!
 * @brief return the flurry-defined key for param - duration
 * @since 11.3.0
 */
+ (FlurryIntegerParam * _Nonnull) duration;

/*!
 * @brief Get the parameters map object for logging the standard events
 * @since 11.3.0
 *
 * @return an NSDictionary object contains all set key-value pairs
 */
- (nonnull NSDictionary<NSString *, NSString *> *)parameters;
/*!
 * @brief set a string value for a user defined key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the string value
 */
- (nonnull FlurryParamBuilder *)setString:(nonnull NSString *)val
                                   forKey:(nonnull NSString *)key
NS_SWIFT_NAME(set(stringVal:key:));
/*!
 * @brief set a string value for a flurry param key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the string value
 */
- (nonnull FlurryParamBuilder *)setString:(nonnull NSString *)val
                                 forParam:(nonnull FlurryStringParam *)key
NS_SWIFT_NAME(set(stringVal:param:));
/*!
 * @brief set an int value for a used defined key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the int value
 */
- (nonnull FlurryParamBuilder *)setInteger:(int)val
                                    forKey:(nonnull NSString *)key
NS_SWIFT_NAME(set(integerVal:key:));
/*!
 * @brief set an int value for a flurry param key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the int value
 */
- (nonnull FlurryParamBuilder *)setInteger:(int)val
                                  forParam:(nonnull FlurryIntegerParam *)key
NS_SWIFT_NAME(set(integerVal:param:));
/*!
 * @brief set a long value for a user defined key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the long value
 */
- (nonnull FlurryParamBuilder *)setLong:(long)val
                                 forKey:(nonnull NSString *)key
NS_SWIFT_NAME(set(longVal:key:));
/*!
 * @brief set a long value for a flurry param key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the long value
 */
- (nonnull FlurryParamBuilder *)setLong:(long)val
                               forParam:(nonnull FlurryLongParam *)key
NS_SWIFT_NAME(set(longVal:param:));
/*!
 * @brief set a boolean value for a user defined key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the boolean value
 */
- (nonnull FlurryParamBuilder *)setBoolean:(BOOL)val
                                    forKey:(nonnull NSString *)key
NS_SWIFT_NAME(set(booleanVal:key:));
/*!
 * @brief set a boolean value for a flurry param key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the boolean value
 */
- (nonnull FlurryParamBuilder *)setBoolean:(BOOL)val
                                  forParam:(nonnull FlurryBooleanParam *)key
NS_SWIFT_NAME(set(booleanVal:param:));
/*!
 * @brief set a double value for a user defined key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the double value
 */
- (nonnull FlurryParamBuilder *)setDouble:(double)val
                                   forKey:(nonnull NSString *)key
NS_SWIFT_NAME(set(doubleVal:key:));
/*!
 * @brief set a double value for a flurry param key
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting the double value
 */
- (nonnull FlurryParamBuilder *)setDouble:(double)val
                                 forParam:(nonnull FlurryDoubleParam *)key
NS_SWIFT_NAME(set(doubleVal:param:));
/*!
 * @brief remove the value for a specified key (user-defined key or flurry param key)
 * @since 11.3.0
 * @code
 *  - (void)someEvent{

        FlurryParamBuilder *param = [[[[[[FlurryParamBuilder alloc] init]
                                    setString:@"Game pro"
 *                                   forParam:[FlurryParamBuilder levelName]]
                                   setInteger:2 forKey:@"level"]
                           removeObjectForKey:[FlurryParamBuilder levelName]]
                           removeObjectForKey:@"level"];
    }
 * @endcode
 *
 * @return FlurryParamBuilder object after removing the value
 */
- (nonnull FlurryParamBuilder *)removeObjectForKey:(nonnull id)key
NS_SWIFT_NAME(remove(key:));
/*!
 * @brief set a standard event parameter by parsing a FlurryParamBuilder object
 * @since 11.3.0
 *
 * @return FlurryParamBuilder object after setting all key-value pairs
 */
- (nonnull FlurryParamBuilder *)setAll:(nonnull FlurryParamBuilder *)param
NS_SWIFT_NAME(set(all:));

@end

@interface Flurry (Event)

/*!
 * @brief Records a standard parameterized event specified by @c eventType with @c parameters.
 * @since 11.3.0
 *
 *  This method allows you to log standard events associated with parameters. Parameters
 *  are extremely valuable as they allow you to store characteristics of an action. For example,
 *  if a user purchased an item (log an purchase event), it may be helpful to know item info (itemName, itemType,
 *  itemId, itemCount), and transaction info (price, totalAmount, currency, transactionId) of such events.
 *
 * @note You should not pass private or confidential information about your users in a
 *  standard event.
 *
 *  A maximum of 10 parameter names may be associated with any event. Sending
 *  over 10 parameter names with a single event will result in no parameters being logged
 *  for that event.
 *
 * @code
 *  - (void)someGamingEvent{

        FlurryParamBuilder *param = [[[[[[FlurryParamBuilder alloc] init]
                                    setString:@"Game pro" forParam:[FlurryParamBuilder levelName]]
                                   setInteger:2 forParam:[FlurryParamBuilder levelNumber]]
                                    setString:@"12345" forKey:@"userId"]
                                   setInteger:10 forKey:@"numOfTrials"];
 
        [Flurry logStandardEvent:FLURRY_EVENT_LEVEL_COMPLETED withParameters:param];
    }
 * @endcode
 *
 * @param eventType FlurryEvent enum.
 * @param parameters a FlurryParam object that stores key-value pairs of a standard parameterized event.
 *
 * @return enum FlurryEventRecordStatus for the recording status of the logged event.
 */

+ (FlurryEventRecordStatus)logStandardEvent:(FlurryEvent)eventType
                             withParameters:(nullable FlurryParamBuilder *)parameters
NS_SWIFT_NAME(log(standardEvent:param:));


@end

